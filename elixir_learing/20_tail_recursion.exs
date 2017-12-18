defmodule Math do
  def double([head | tail]) do
    [head * 2 | double(tail)]
  end

  def double([]) do
    []
  end
end

x = Math.double([1,2,3])
IO.inspect x
