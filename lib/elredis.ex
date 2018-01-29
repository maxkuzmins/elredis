defmodule Elredis do
  use Application
  @timeout 5000

  @moduledoc """
  Documentation for Elredis.
  """

  @doc """
  TODO - update comment for start
  Hello world.


  """
  def start(_type, _args) do
    :ok = Elredis.Pool.validate_env()
    # TODO - I don't think elredis itself needs a supervisor. We will create one per connection
    # TODO - in start_link_client calls below
    Elredis.Supervisor.start_link(name: Elredis.Supervisor)
  end

  def start_link_client() do
    start_link_client({127, 0, 0, 1}, 6379, 0, String.codepoints(""))
  end

  def start_link_client(host, port) do
    start_link_client(host, port, 0, String.codepoints(""))
  end

  def start_link_client(host, port, database) do
    start_link_client(host, port, database, String.codepoints(""))
  end

  def start_link_client(host, port, database, password) do
    start_link_client(host, port, database, password, 100)
  end

  def start_link_client(host, port, database, password, reconnectSleep) do
    start_link_client(host, port, database, password, reconnectSleep, @timeout)
  end

  def start_link_client(host, port, database, password, reconnectSleep, connectTimeout)
  when is_tuple(host) or is_list(host) and
       is_integer(port) and
       is_integer(database) or database == :undefined and
       is_list(password) and
       is_integer(reconnectSleep) or reconnectSleep == :no_reconnect and
       is_integer(connectTimeout) do

    # TODO - create elredis_client module and use it as a proxy to create eredis client procs
    # TODO - this function to return pid of a Elredis.client_sup

    :eredis.start_link(host, port, database, password, reconnectSleep, connectTimeout)
  end

  def start_link_cluster(listOfNodes) do
    GenServer.start_link(Elredis.Cluster.Client.Server, listOfNodes, [])
  end

  def q(client, command) do
    Elredis.q(client, command, @timeout)
  end

  def q(client, command, timeout) when is_pid(client) do
    :eredis.q(client, command, timeout)
  end

  def q({:cluster_id, clusterServerPid} = clusterServerId, command, timeout) do
    # todo - forward command to cluster server pid

    :io.format("cluster command received. ID:~p, command ~p, timeout ~p.", [clusterServerId, command, timeout])

  end

end

