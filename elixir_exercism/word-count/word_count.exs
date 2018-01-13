defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    sentence
    |> String.downcase
    |> String.split([" ", "_", "!", "@", ",", ":", "$", "%", "^", "&"], trim: true)
    |> Enum.reduce(%{}, fn(x, acc) ->
      case Map.get(acc, x) do
        nil -> Map.put(acc, x, 1)
        _ -> Map.put(acc, x, Map.get(acc, x) + 1)
      end
    end)
  end
end
