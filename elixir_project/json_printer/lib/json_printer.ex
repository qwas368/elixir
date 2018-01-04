defmodule JsonPrinter do
  use Application
  @moduledoc """
  Documentation for JsonPrinter.
  """

  def append_torrent(d, bool) do
    %{d | "tolerance" => bool}
  end

  def start(_type, _args) do
    content = [
      %{
        "userid" => "da007",
        "groupid" => "KIWI",
        "username" => "da007",
        "birthday" => ~D[2000-01-01]
      }
      |
      Enum.map(20000..26000, fn n ->
      %{
        "userid" => to_string(n),
        "groupid" => "KIWI",
        "username" => to_string(n),
        "birthday" => ~D[2000-01-01]
      } end)
      ++
      Enum.map(20000..22000, fn n ->
      %{
        "userid" => to_string(n),
        "groupid" => "BANANA",
        "username" => to_string(n),
        "birthday" => ~D[2000-01-01]
      } end)
      ++
      Enum.map(20000..21000, fn n ->
      %{
        "userid" => to_string(n),
        "groupid" => "PEAR",
        "username" => to_string(n),
        "birthday" => ~D[2000-01-01]
      } end)]

      root =
        %{
          "replaceList" => content,
          "tolerance" => false
        }
    File.write!(~S"C:\Users\yj_hu\Desktop\test.json", Poison.encode!(root), [:binary])
  end
end
