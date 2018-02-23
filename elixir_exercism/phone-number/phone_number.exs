defmodule Phone do
  @doc """
  Remove formatting from a phone number.

  Returns "0000000000" if phone number is not valid
  (10 digits or "1" followed by 10 digits)

  ## Examples

  iex> Phone.number("212-555-0100")
  "2125550100"

  iex> Phone.number("+1 (212) 555-0100")
  "2125550100"

  iex> Phone.number("+1 (212) 055-0100")
  "0000000000"

  iex> Phone.number("(212) 555-0100")
  "2125550100"

  iex> Phone.number("867.5309")
  "0000000000"
  """
  @spec number(String.t) :: String.t
  def number(raw) do
    if is_valid?(raw) do
      raw
      |> String.replace(~r/[^\d]/, "")
      |> (&(Regex.run(~r/[2-9]\d{2}\d{3}\d{4}$/, &1))).()
      |> Enum.join("")
      # |> IO.inspect
    else
      "0000000000"
    end
  end

  def is_valid?(raw) do
    cond do
      Regex.match?(~r/^(|\+\d)\s*\([2-9]\d{2}\)(-|\s*)[2-9]\d{2}-\d{4}$/, raw) -> true
      Regex.match?(~r/^[2-9]\d{2}\.[2-9]\d{2}\.\d{4}$/, raw) -> true
      Regex.match?(~r/^\d\s[2-9]\d{2}\s[2-9]\d{2}\s\d{4}$/, raw) -> true
      Regex.match?(~r/^[1]?[2-9]\d{2}[2-9]\d{6}$/, raw) -> true
      true -> false
    end
  end
  @doc """
  Extract the area code from a phone number

  Returns the first three digits from a phone number,
  ignoring long distance indicator

  ## Examples

  iex> Phone.area_code("212-555-0100")
  "212"

  iex> Phone.area_code("+1 (212) 555-0100")
  "212"

  iex> Phone.area_code("+1 (012) 555-0100")
  "000"

  iex> Phone.area_code("867.5309")
  "000"
  """
  @spec area_code(String.t) :: String.t
  def area_code(raw) do
    number(raw)
    |> String.slice(0..2)
  end

  @doc """
  Pretty print a phone number

  Wraps the area code in parentheses and separates
  exchange and subscriber number with a dash.

  ## Examples

  iex> Phone.pretty("212-555-0100")
  "(212) 555-0100"

  iex> Phone.pretty("212-155-0100")
  "(000) 000-0000"

  iex> Phone.pretty("+1 (303) 555-1212")
  "(303) 555-1212"

  iex> Phone.pretty("867.5309")
  "(000) 000-0000"
  """
  @spec pretty(String.t) :: String.t
  def pretty(raw) do
    number(raw)
    |> (fn(num) -> "(#{String.slice(num, 0..2)}) #{String.slice(num, 3..5)}-#{String.slice(num, 6..9)}" end).()
  end
end
