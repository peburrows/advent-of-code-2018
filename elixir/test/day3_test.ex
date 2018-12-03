defmodule Advent.Day3Test do
  use ExUnit.Case

  describe "problem 1" do
    test "case 1" do
      assert 4 ==
               """
               #1 @ 1,3: 4x4
               #2 @ 3,1: 4x4
               #3 @ 5,5: 2x2
               """
               |> Advent.Day3.overlapping_area()
    end

    test "solution with input" do
      assert 113_966 == Advent.Day3.problem1()
    end
  end

  describe "problem 2" do
    test "case 1" do
      assert "3" ==
               """
               #1 @ 1,3: 4x4
               #2 @ 3,1: 4x4
               #3 @ 5,5: 2x2
               """
               |> Advent.Day3.no_overlap()
    end

    test "solution with input" do
      assert "235" == Advent.Day3.problem2()
    end
  end
end
