defmodule ApiTest do
  use ExUnit.Case
  doctest Api

  test "greets the world" do
    assert API.hello() == :world
  end
end
