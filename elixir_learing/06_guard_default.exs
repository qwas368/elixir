defmodule GuardDefault do
  def function(name, year \\ "16")
  def function(name, year) when is_binary(year) do
    IO.puts "#{name} wanna sister"
  end
  def function(name, year) when is_binary(year) do
    IO.puts "#{name} wanna sister"
  end
end

GuardDefault.function("I")
