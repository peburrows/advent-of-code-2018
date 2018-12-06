defmodule Advent.Day6Test do
  use ExUnit.Case
  alias Advent.Day6

  @input """
  1, 1
  1, 6
  8, 3
  3, 4
  5, 5
  8, 9
  """

  describe "problem 1" do
    test "extract_coordinates" do
    end

    test "distance calculation" do
      assert 4 == Day6.distance({1, 3}, {3, 1})
      assert 10 == Day6.distance({5, 5}, {0, 0})
      assert 2 == Day6.distance({5, 5}, {6, 6})
    end

    test "edge_point?" do
      assert Day6.edge_point?({5, 10}, {10, 10})
      assert Day6.edge_point?({0, 5}, {10, 10})
      refute Day6.edge_point?({1, 5}, {10, 10})
    end

    test "closest" do
      assert {{5, 5}, 2} =
               Day6.closest(
                 [{5, 4}, {5, 5}, {6, 9}, {10, 15}],
                 {6, 6}
               )

      assert {{5, 5}, 0} =
               Day6.closest(
                 [{5, 4}, {4, 5}, {5, 5}, {6, 9}, {10, 15}],
                 {5, 5}
               )
    end

    test "closest returns nil on conflict" do
      assert {:conflict, nil} ==
               Day6.closest(
                 [{5, 5}, {7, 7}, {10, 15}],
                 {6, 6}
               )
    end

    test "case 1" do
      assert {{5, 5}, 17} = Day6.largest(@input)
    end

    test "solution" do
      # we should make this faster
      assert {{226, 262}, 4829} = Day6.problem1()
    end
  end

  describe "problem 2" do
    test "case 1" do
      assert 16 == Day6.safe_space(@input, 32)
    end

    test "solution" do
      assert 46966 == Day6.problem2()
    end
  end
end
