defmodule ModA do
  def moda() do
    IO.inspect "test"
  end
end

defmodule ModB do
  def modb(x) when x == ModA do
    x.modB()
  end
end

ModB.moodb(A);
