defmodule M do
  @name M
  def func do
    IO.inspect  __MODULE__
    IO.inspect  M
    IO.inspect  @name
    IO.puts @name
    IO.puts __MODULE__
    IO.puts M
  end
end

M.func
