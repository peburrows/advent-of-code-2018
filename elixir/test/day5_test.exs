defmodule Advent.Day5Test do
  use ExUnit.Case
  alias Advent.Day5

  describe "problem 1" do
    test "case 1" do
      input = "dabAcCaCBAcCcaDA"
      assert "dabCBAcaDA" == Day5.react(input)
    end

    test "solution" do
      assert 10762 == Day5.problem1()
    end
  end

  describe "problem 2" do
    test "solution" do
      assert 6946 == Day5.problem2()
    end
  end
end
