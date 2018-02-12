defmodule Pangram do
  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """

  @spec pangram?(String.t) :: boolean
  def pangram?(sentence) do
    sentence
    |> String.downcase
    |> (&Regex.scan(~r{[a-z]}, &1)).()
    |> Enum.uniq
    |> (&(length(&1) == 26)).()
  end
end

Pangram.pangram?("the quick brown fox jumps over the lazy dog")
