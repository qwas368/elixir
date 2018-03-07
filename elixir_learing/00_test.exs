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

IO.inspect String.downcase("EE3F54C7-CDEF-471B-AC19-CB040A5BEBF1")
