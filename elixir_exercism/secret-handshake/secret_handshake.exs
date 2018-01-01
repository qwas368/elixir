defmodule SecretHandshake do
  @action_list ["wink",  "double blink", "close your eyes", "jump"]
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    Integer.digits(code, 2)
    |> Enum.reverse()
    |> f(@action_list, [])
  end

  defp f([code_head | code_tail], [word_head | word_tail], acc) do
    if code_head == 1 do
      f(code_tail, word_tail, acc ++ [word_head])
    else
      f(code_tail, word_tail, acc)
    end
  end

  defp f([], _, acc), do: acc

  defp f(code, [], acc) do
    if List.first(code) == 1 do
      Enum.reverse(acc)
    else
      acc
    end
  end
end
