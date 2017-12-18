defmodule Recursion do
  def function(num) do
    if num != 0 do
      IO.puts num
      function(num-1)
    end
  end
end

Recursion.function(55)
