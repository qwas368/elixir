guid_regex = ~r"^[{(]?[0-9A-F]{8}[-]?([0-9A-F]{4}[-]?){3}[0-9A-F]{12}[)}]?$"
IO.inspect "CA761232-ED42-11CE-BACD-00AA0057B223" =~ guid_regex
IO.inspect bit_size("1234")
IO.inspect bit_size(<<123,2132,123,123>>)

try do
  :foo + 1
  raise "oops"
rescue
  RuntimeError -> IO.inspect "RuntimeError!"
  ArithmeticError -> IO.inspect "ArgumentError!"
end

IO.inspect Path.dirname(".\01_hello_world.exc")
IO.inspect File.read!("elixir_learing\\01_hello_world.exs")

defmodule MMM do
  @spec func() :: integer
  def func do
    throw("oops")
  end
end

try do
  # MMM.func
after
  IO.inspect "?!"
end

IO.inspect "===================="

try do
  # raise("message")
rescue
  _-> IO.inspect "1"
else
  _-> IO.inspect "2"
end
