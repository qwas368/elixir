defmodule NamingFunction do
  def function do
    IO.puts "a naming function!"
  end
end

defmodule NamingFunction2 do
  def function(name) when is_binary(name) do
    IO.puts "Hi, #{name}."
  end
  def function(names) when is_list(names) do
    IO.puts "Hi, everyone."
  end
end

NamingFunction.function
NamingFunction2.function("john")
NamingFunction2.function(["john", "me"])
