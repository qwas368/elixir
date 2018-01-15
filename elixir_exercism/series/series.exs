defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(_s, size) when size <= 0, do: []
  def slices(s, size) do
    substring = String.slice(s, 0..size-1)
    cond do
      String.length(s) < size -> []
      String.length(s) == size -> [substring]
      true -> [substring | slices(s |> String.split_at(1) |> elem(1), size)]
    end
  end
end
