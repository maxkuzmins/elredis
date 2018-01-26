defmodule Elredis.Supervisor do
  @moduledoc false
  
  use Supervisor

  def start_link(arg) do
    Supervisor.start_link(__MODULE__, arg)
  end

  def init(arg) do
    :io.format("Please use Elredis.start_link/N to create client connections to Redis.~n", [])
    children = []
    supervise(children, strategy: :one_for_one)
  end
end
