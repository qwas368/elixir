defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: {:ok, kind} | {:error, String.t()}
  def kind(a, b, c) when a <= 0 or b <= 0 or c <= 0 do
    {:error, "all side lengths must be positive"}
  end
  def kind(a, b, c) when a + b <= c or b + c <= a or c + a <= b do
    {:error, "side lengths violate triangle inequality"}
  end
  def kind(a, b, c) do
    cond do
      a == b && a == c -> {:ok, :equilateral}
      a == b || a == c || b == c -> {:ok, :isosceles}
      true -> {:ok, :scalene}
    end
  end
end
