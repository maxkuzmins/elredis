defmodule Elredis.Cluster.Client.Server do
  @moduledoc false

  @tab_cluster_state      :tab_cluster_state
  @tab_hash_slots         :tab_hash_slots

  # State map keys:
  @nodes                  :nodes
  @node_client            :node_client
  @node_host              :node_host
  @node_port              :node_port
  @node_database          :node_database
  @node_password          :node_password
  @node_reconnect_sleep   :node_reconnect_sleep
  @node_connect_timeout   :node_connect_timeout

  use GenServer

  # TODO - define custom type describing format of cluster opts

  def q(clusterServerPid, command, timeout) when is_pid(clusterServerPid) do
    GenServer.call(clusterServerPid, {:q, command, timeout})
  end

  def start_link(opts) do
    state = %{}
    GenServer.start_link(__MODULE__, state, opts)
  end

  def init(listOfNodes) do

    # todo - remove
    :io.format("~p is called with ~p~n", [__ENV__.module, listOfNodes])


    state = Enum.map(listOfNodes, &init_node/1)

    @tab_cluster_state = :ets.new(@tab_cluster_state, [:protected, :named_table])
    @tab_hash_slots = :ets.new(@tab_hash_slots, [:protected, :named_table])
    {:ok, state}
  end

  # todo - move lower?
  defp init_node({host, port, database, password, reconnectSleep, connectTimeout}) do
    {ok, client} = Elredis.start_link_client(host, port, database, password, reconnectSleep, connectTimeout)
    %{
      @node_client => client,
      @node_host => host,
      @node_port => port,
      @node_database => database,
      @node_password => password,
      @node_reconnect_sleep => reconnectSleep,
      @node_connect_timeout => connectTimeout
    }
  end



  def handle_call({:q, command, timeout}, _from, state) do
    {target_node, ^state} = get_node(command, state)
    {result, ^state} = handle_q(target_node, command, timeout, state)
    {:reply, result, state}
  end
  def handle_call(_msg, _from, state) do
    {:reply, :ok, state}
  end

  def handle_cast(_msg, state) do
    {:noreply, state}
  end

  defp handle_q(%{@node_client => node_client} = node, ["GET" | _] = command, timeout, state) do
    case :eredis.q(node_client, command, timeout) do
      # todo - handle result here. if redirect - update hashslots and re-send
      result -> {result, state}
    end

  end

  defp handle_q(%{@node_client => node_client} = node, command, timeout, state) do
    result = :eredis.q(node_client, command, timeout)
    {result, state}
  end

  defp get_node(command, state) do
    # todo - find and return an appropriate node for the given command. update state if needed.
    {_node, ^state} = random_node(state)
  end

  defp random_node(%{@nodes => nodes} = state) do
    {Enum.random(nodes), state}
  end
# todo
#  defp update_hash_slots

end
