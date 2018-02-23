defmodule BracketPush do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) when is_binary(str)do
    ~r/[\{\}\[\]\(\)]/
    |> Regex.scan(str)
    |> List.flatten
    |> check_brackets_rec
    |> (fn(result) ->
          case result do
            {:pass, []} -> true
            {:pass, _} -> false
            {:conflict, _} -> false
          end
        end).()
  end

  @spec check_brackets_rec(list(String.t)) :: {:pass, list} | {:conflict, list}
  defp check_brackets_rec([]), do: {:pass, []}
  defp check_brackets_rec([bracket1 | tail] = list) when is_list(list) do
    cond do
      bracket1 == "}" || bracket1 == "]" || bracket1 == ")" -> {:pass, list}
      bracket1 == "{" || bracket1 == "[" || bracket1 == "(" ->
        case check_brackets_rec(tail) do
          {:pass, []} -> {:conflict, nil}
          {:pass, [bracket2 | tail2]} ->
            if bracket_match(bracket1, bracket2) do
              check_brackets_rec(tail2)
            else
              {:conflict, nil}
            end
          {:conflict, _} -> {:conflict, nil}
        end
    end
  end

  @spec bracket_match(String.t, String.t) :: boolean()
  defp bracket_match(left, right) do
    cond do
      left == "(" && right == ")" -> true
      left == "{" && right == "}" -> true
      left == "[" && right == "]" -> true
      true -> false
    end
  end
end
