defmodule Stack do
  use GenServer

  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  ## Callbacks

  def init(stack) do
    {:ok, stack}
  end

  def handle_call(:pop, _from, [h | t]) do
    {:reply, h, t}
  end

  def handle_cast({:push, h}, t) do
    {:noreply, [h | t]}
  end
end

defmodule KV.Supervisor do
  use Supervisor

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, :ok, opts)
  end

  def init(:ok) do
    children = [
      Stack
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end

{:ok, pid} =  Stack.start_link([])
