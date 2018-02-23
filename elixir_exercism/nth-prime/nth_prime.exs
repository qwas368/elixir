defmodule Prime do

  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(count) when count > 0 do
    0
    |> Stream.iterate(&(next_prime(&1+1)))
    |> Enum.at(count)
  end
  def nth(_count) do
    raise "error!"
  end

  @spec next_prime(non_neg_integer) :: non_neg_integer
  def next_prime(num) do
    if (prime?(num)) do
      num
    else
      next_prime(num+1)
    end
  end

  @spec prime?(non_neg_integer) :: boolean()
  def prime?(num) when num < 2, do: false
  def prime?(num) when num == 2, do: true
  def prime?(num) do
    2..num-1
    |> Enum.any?(fn(x) -> rem(num, x) == 0 end)
    |> if do false else true end
  end
end
