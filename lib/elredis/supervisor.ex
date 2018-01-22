defmodule Elredis.Supervisor do
  @moduledoc false
  


  use Supervisor

  def start_link(arg) do
    Supervisor.start_link(__MODULE__, arg)
  end

  def init(arg) do

    :io.format("hi from supervisor. I'm about to die btw.~n", [])

    # TODO - start eredis here
    children = [
      worker(Elredis.Observer, [arg], restart: :temporary)
    ]

    supervise(children, strategy: :one_for_one)
  end
end