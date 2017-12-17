IO.inspect length([1,2,3])
IO.inspect length([a: 1,b: 2,c: 3])
IO.inspect tuple_size({:a,1,2})
IO.inspect byte_size("124d")

defprotocol Size do
  @doc "Calculates the size (and not the length!) of a data structure"
  def size(data)
end

defimpl Size, for: BitString do
  def size(string), do: byte_size(string)
end

defimpl Size, for: Map do
  def size(map), do: map_size(map)
end

defimpl Size, for: Tuple do
  def size(tuple), do: tuple_size(tuple)
end
