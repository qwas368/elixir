defmodule MyProjectTest do
  use ExUnit.Case
  doctest MyProject

  test "greets the world" do
    assert MyProject.hello() == :world
  end

  test "sorry the world" do
    assert MyProject.hello() == :oop
  end
end
