defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    sort_form = &(&1 |> String.downcase |> String.codepoints |> Enum.sort |> Enum.join)

    Enum.filter(candidates, fn(x) ->
      cond do
        String.downcase(base) == String.downcase(x) -> false
        true -> sort_form.(base) == sort_form.(x)
      end
    end)
  end
end
