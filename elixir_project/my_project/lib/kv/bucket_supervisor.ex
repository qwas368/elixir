defmodule KV.BucketSupervisor do
  use Supervisor

  # A simple module attribute that stores the supervisor name
  @name KV.BucketSupervisor

  def start_link(_opts) do
    IO.inspect ("BucketSupervisor start_link()")
    Supervisor.start_link(__MODULE__, :ok, name: @name)
  end

  def start_bucket do
    IO.inspect ("BucketSupervisor start_bucket()")
    Supervisor.start_child(@name, [])
  end

  def init(:ok) do
    IO.inspect ("BucketSupervisor init()")
    Supervisor.init([KV.Bucket], strategy: :simple_one_for_one)
  end
end
