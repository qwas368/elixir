defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    factors
    |> Enum.map(&to_multiples_list([0], limit, &1))
    |> Enum.flat_map(&(&1))
    |> Enum.uniq
    |> Enum.sum
  end

  defp to_multiples_list(acc, limit, factor) when is_integer(factor) do
    next_num = List.last(acc) + factor
    cond do
      next_num >= limit -> acc
      true -> to_multiples_list(acc ++ [next_num], limit, factor)
    end
  end
end
