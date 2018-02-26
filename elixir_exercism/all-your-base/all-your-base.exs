defmodule AllYourBase do
  @doc """
  Given a number in base a, represented as a sequence of digits, converts it to base b,
  or returns nil if either of the bases are less than 2
  """

  @spec convert(list, integer, integer) :: list
  def convert(digits, base_a, base_b) when base_a > 1 and base_b > 1 and length(digits) > 0 do
    with true <- digits_valid?(digits, base_a),
         decimal <- to_decimal(digits, base_a)
    do
      to_digits(decimal, base_b)
    else
      _ -> nil
    end
  end
  def convert(_, _, _), do: nil

  @spec digits_valid?(list, integer) :: boolean
  defp digits_valid?(digits, base) do
    digits |> Enum.all?(fn(x) -> x >= 0 && x < base end)
  end

  @spec to_digits(integer, integer) :: list
  def to_digits(number, base), do: to_digits(number, base, [], 0)
  defp to_digits(number, _base, digits, _power) when number == 0 and digits != [], do: digits
  defp to_digits(number, _base, _digits, _power) when number == 0, do: [0]
  defp to_digits(number, base, digits, power) do
    divisor = :math.pow(base, power) |> Kernel.trunc
    remainder = rem(number, divisor * base)
    to_digits(number - remainder, base, [remainder/divisor |> Kernel.trunc | digits], power + 1)
  end

  @spec to_digits(integer, integer) :: list
  def to_decimal(number, base) do
    number
    |> Enum.reverse
    |> Enum.reduce({0, 0}, fn(x, acc) ->
      {sum, power} = acc
      {sum + :math.pow(base, power) * x, power + 1}
    end)
    |> elem(0)
    |> Kernel.trunc
  end
end
