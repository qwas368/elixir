defmodule PigLatin do
  @vowels ["a", "e", "i", "o", "u"]
  @special_consonants ["ch", "qu", "squ", "th", "thr", "sch"]
  @special_vowels ["yt", "xr"]

  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split(" ")
    |> Enum.map(&(translate_single_string(&1) <> "ay"))
    |> Enum.join(" ")
  end

  def translate_single_string(string) do
    cond do
      String.starts_with?(string, @special_consonants) ->
        splite_prefix(string, @special_consonants)
        |> Enum.reverse
        |> Enum.join("")
        |> translate_single_string
      String.starts_with?(string, @special_vowels) ->
        string
      true ->
        prefix = string
        |> String.graphemes
        |> Enum.take_while(&(&1 not in @vowels))
        |> to_string
        splite_prefix(string, [prefix]) |> Enum.reverse |> Enum.join("")
    end
  end

  def splite_prefix(string, prefix_array) do
    prefix = prefix_array |> Enum.find(&(String.starts_with?(string, &1)))
    [prefix | [String.replace_prefix(string, prefix, "")]]
  end
end
