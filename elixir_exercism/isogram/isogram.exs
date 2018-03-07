defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t()) :: boolean
  def isogram?(sentence) do
    sentence
    |> String.replace(~r/[- ]/, "")
    |> String.codepoints
    |> (fn(list) -> length(list) == list |> Enum.uniq |> length end).()
  end
end
