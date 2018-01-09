defmodule Bob do
  def hey(input) do
    cond do
      input |> String.last == "?" ->
        "Sure."
      !has_lower_case(input) && has_uppper_case(input)->
        "Whoa, chill out!"
      input |> String.trim |> String.length == 0 ->
        "Fine. Be that way!"
      true ->
        "Whatever."
    end
  end

  @spec has_lower_case(String.s) :: boolean
  def has_lower_case input do
    !(input == String.upcase(input))
  end

  @spec has_uppper_case(String.s) :: boolean
  def has_uppper_case input do
    !(input == String.downcase(input))
  end
end
