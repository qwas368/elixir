defmodule Module1 do
  @const_num 5
  def function do
    IO.puts "Module1.function" <> Integer.to_string(@const_num)
  end
end

defmodule Module2 do
  def function do
    IO.puts "Module2.function"
  end
end

defmodule Module3 do
  defmodule Module1 do
    def function do
      IO.puts "Module3.Module1.function"
    end
  end

  defmodule Module2 do
    def function do
      IO.puts "Module3.Module2.function"
    end
  end
end

Module3.Module1.function

defmodule Module4 do
  @greeting "Hello"

  def greeting(name) do
    ~s(#{@greeting} #{name}.)
  end
end 
