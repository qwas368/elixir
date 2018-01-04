defmodule M do
  defstruct [
    name: "J",
    address: "K"
  ]

  def fun(s) do
    # ...
  end
end

M.fun(%M{})
IO.inspect %M{}
