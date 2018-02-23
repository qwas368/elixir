defmodule M do
  @map %{
    "1" => 1,
    "2" => 2
  }
  @open_brackets Map.keys(@map)

  def function_name(a) when a in @open_brackets do
    IO.inspect Map.keys(@map)
  end

  def function_name(a) do
    IO.inspect "baz"
  end
end

M.function_name("2")
