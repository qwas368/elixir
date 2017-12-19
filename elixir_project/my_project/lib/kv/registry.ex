defmodule KV.Registry do
  use GenServer

  ## Client API

  @doc """
  Starts the registry.
  """
  def start_link(opts) do
    IO.inspect 1
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  @doc """
  Looks up the bucket pid for `name` stored in `server`.

  Returns `{:ok, pid}` if the bucket exists, `:error` otherwise.
  """
  def lookup(server, name) do
    IO.inspect 2
    GenServer.call(server, {:lookup, name})
  end

  @doc """
  Ensures there is a bucket associated with the given `name` in `server`.
  """
  def create(server, name) do
    IO.inspect 3
    GenServer.cast(server, {:create, name})
  end

  ## Server Callbacks

  def init(:ok) do
    IO.inspect 4
    {:ok, %{}}
  end

  def handle_call({:lookup, name}, _from, names) do
    IO.inspect 5
    {:reply, Map.fetch(names, name), names}
  end

  def handle_cast({:create, name}, names) do
    IO.inspect 6
    if Map.has_key?(names, name) do
      {:noreply, names}
    else
      {:ok, bucket} = KV.Bucket.start_link([])
      {:noreply, Map.put(names, name, bucket)}
    end
  end
end
