defmodule Stack do
  use GenServer

  def start_link(state) do
    IO.inspect  "Stack start_link()"
    IO.inspect  state
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  ## Callbacks

  def init(stack) do
    IO.inspect  stack
    {:ok, stack}
  end

  def handle_call(:pop, _from, [h | t]) do
    IO.inspect  [h | t]
    {:reply, h, t}
  end

  def handle_cast({:push, h}, t) do
    IO.inspect  t
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

{:ok, pid} = Supervisor.start_link([
  {Stack, [:hello]}
], strategy: :one_for_one)

IO.inspect GenServer.call(Stack, :pop)
IO.inspect GenServer.cast(Stack, {:push, :world})
IO.inspect GenServer.call(Stack, :pop)
