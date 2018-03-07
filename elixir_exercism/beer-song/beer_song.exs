defmodule BeerSong do
  @beersong_verse_over_one """
  {0} of beer on the wall, {1} of beer.
  Take one down and pass it around, {2} of beer on the wall.
  """

  @beersong_verse_one """
  1 bottle of beer on the wall, 1 bottle of beer.
  Take it down and pass it around, no more bottles of beer on the wall.
  """

  @beersong_verse_zero """
  No more bottles of beer on the wall, no more bottles of beer.
  Go to the store and buy some more, 99 bottles of beer on the wall.
  """
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(number) do
    case number do
      0 -> @beersong_verse_zero
      1 -> @beersong_verse_one
      _ ->
        @beersong_verse_over_one
        |> String.replace("{0}", bottles_string(number))
        |> String.replace("{1}", bottles_string(number))
        |> String.replace("{2}", bottles_string(number-1))
    end
  end

  defp bottles_string(number) do
    case number do
      1 -> "1 bottle"
      _ -> "#{Integer.to_string(number)} bottles"
    end
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range \\ 99..0) do
    range
    |> Enum.reduce("", fn(x, acc) -> "#{acc}#{verse(x)}\n" end)
    |> String.trim_trailing()
    |> (&("#{&1}\")).()
  end
end
