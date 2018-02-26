defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  @roman_table %{
    1 => "I",
    5 => "V",
    10 => "X",
    50 => "L",
    100 => "C",
    500 => "D",
    1000 => "M",
  }

  @spec numerals(pos_integer) :: String.t
  def numerals(number) do
    [1, 10, 100, 1000]
    |> Enum.reduce("", fn(x, acc) -> (number |> get_digit_num(x) |> to_roman(x)) <> acc end)
  end

  @spec get_digit_num(pos_integer, pos_integer) :: String.t
  def get_digit_num(number, digit) do
    index = digit |> Integer.digits |> length |> (&(&1-1)).()

    Integer.digits(number)
    |> Enum.reverse
    |> Enum.at(index, 0)
  end

  @spec to_roman(pos_integer, pos_integer) :: String.t
  def to_roman(number, _digit) when number == 0, do: ""
  def to_roman(number, digit) when number < 4, do: @roman_table |> Map.get(digit) |> List.duplicate(number) |> List.to_string
  def to_roman(number, digit) when number == 4, do: "#{Map.get(@roman_table, digit)}#{Map.get(@roman_table, digit*5)}";
  def to_roman(number, digit) when number > 4 and number < 9, do: "#{Map.get(@roman_table, digit*5)}#{to_roman(number - 5, digit)}";
  def to_roman(number, digit) when number == 9, do: "#{Map.get(@roman_table, digit)}#{Map.get(@roman_table, digit*10)}";
end
