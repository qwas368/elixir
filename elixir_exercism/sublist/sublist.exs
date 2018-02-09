defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      equal?(a, b) -> :equal
      sublist?(a, b) -> :sublist
      sublist?(b, a) -> :superlist
      true -> :unequal
    end
  end

  @spec equal?(list(integer), list(integer)) :: boolean()
  defp equal?(a, b), do: a === b

  @spec sublist?(list(integer) , list(integer)) :: boolean()
  defp sublist?([], _), do: true
  defp sublist?(a, b) when length(a) > 0 do
    b
    |> Enum.chunk_every(length(a), 1, :discard)
    |> Enum.any?(&equal?(a, &1))
  end
end
