defmodule Advent.Day1Test do
  alias Advent.Day1
  use ExUnit.Case

  describe "find_frequency" do
    test "input 1" do
      assert 3 == Day1.find_frequency(0, ~w(+1 +1 +1))
    end

    test "input 2" do
      assert 0 == Day1.find_frequency(0, ~w(+1 +1 -2))
    end

    test "input 3" do
      assert -6 == Day1.find_frequency(0, ~w(-1 -2 -3))
    end

    test "solution" do
      assert 500 == Day1.problem1()
    end
  end

  describe "find_repeated" do
    test "input 1" do
      assert 0 == Day1.find_repeated(~w(+1 -1))
    end

    test "input 2" do
      assert 10 == Day1.find_repeated(~w(+3 +3 +4 -2 -4))
    end

    test "input 3" do
      assert 5 == Day1.find_repeated(~w(-6 +3 +8 +5 -6))
    end

    test "input 4" do
      assert 14 == Day1.find_repeated(~w(+7 +7 -2 -7 -4))
    end

    test "solution" do
      assert 709 == Day1.problem2()
    end
  end
end
