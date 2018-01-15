defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    string = [3, 5, 7] |> Enum.reduce("", fn(x, acc) -> "#{acc}#{convert(number, x)}" end)
    if string == "" do
      to_string(number)
    else
      string
    end
  end

  defp convert(number, divisor) do
    case divisor do
      3 -> if rem(number, divisor) == 0 do "Pling" else "" end
      5 -> if rem(number, divisor) == 0 do "Plang" else "" end
      7 -> if rem(number, divisor) == 0 do "Plong" else "" end
    end
  end
end
