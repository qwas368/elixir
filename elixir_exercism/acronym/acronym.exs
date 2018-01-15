defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.split
    |> Enum.map(&Regex.scan(~r"[A-Z]*[a-z]*", &1))
    |> List.flatten
    |> Enum.reject(&(String.trim(&1) == ""))
    |> Enum.map(&String.at(&1, 0))
    |> Kernel.to_string
    |> String.upcase
    end
end
