defmodule MyProject do
  use Application
  @moduledoc """
  Documentation for MyProject.
  """

  @doc """
  Hello world.

  ## Examples

      iex> MyProject.hello
      :world

  """
  def hello do
    :world
  end

  def start(_type, _args) do
    KV.Supervisor.start_link(name: KV.Supervisor)
  end
end
