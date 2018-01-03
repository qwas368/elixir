defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> to_charlist
    |> Enum.map(fn(c) -> rotate_chat(c, shift) end)
    |> to_string
  end

  def rotate_chat(chat, shift) do
    upcase_alphabet_list = Enum.to_list(?A..?Z)
    lowercase_alphabet_list = Enum.to_list(?a..?z)

    cond do
      Enum.any?(upcase_alphabet_list, fn(c) -> c == chat end) ->
        if Enum.any?(upcase_alphabet_list, fn(c) -> c == chat + shift end) do
          chat + shift
        else
          chat + shift - 26
        end

      Enum.any?(lowercase_alphabet_list, fn(c) -> c == chat end) ->
        if Enum.any?(lowercase_alphabet_list, fn(c) -> c == chat + shift end) do
          chat + shift
        else
          chat + shift - 26
        end

      true -> chat
    end
  end
end
