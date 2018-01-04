defmodule JsonPrinterTest do
  use ExUnit.Case
  doctest JsonPrinter

  test "greets the world" do
    assert JsonPrinter.hello() == :world
  end
end
