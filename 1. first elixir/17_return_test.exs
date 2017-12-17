defmodule M do
  def function(n) do
    if is_integer(n) do
      x = 1
      1
    else
      y = 2
      2
    end
  end
end

IO.inspect M.function(1)
