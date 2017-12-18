function_is_atom = &is_atom/1
IO.puts is_function(function_is_atom)
IO.inspect function_is_atom

defmodule M do
  def function(s) when is_binary(s) do
    IO.puts s
  end
  def function({:ok, s}) do
    IO.puts s
  end
end

m_function = &M.function/1
m_function.("test1")
m_function.({:ok, "test2"})
