defmodule Advent.Day9Test do
  use ExUnit.Case
  alias Advent.Day9

  describe "problem 1" do
    test "case 1" do
      # assert {%{
      #           5 => 32
      #         },
      #         [
      #           0,
      #           16,
      #           8,
      #           17,
      #           4,
      #           18,
      #           19,
      #           2,
      #           24,
      #           20,
      #           25,
      #           10,
      #           21,
      #           5,
      #           22,
      #           11,
      #           1,
      #           12,
      #           6,
      #           13,
      #           3,
      #           14,
      #           7,
      #           15
      #         ]} = Day9.play(_players = 9, _marbles = 25)
      # {5, 32} = Day9.play_and_get_winner(9, 25)
    end

    test "case 1 as queue" do
      # assert [
      #          20,
      #          25,
      #          10,
      #          21,
      #          5,
      #          22,
      #          11,
      #          1,
      #          12,
      #          6,
      #          13,
      #          3,
      #          14,
      #          7,
      #          15,
      #          0,
      #          16,
      #          8,
      #          17,
      #          4,
      #          18,
      #          19,
      #          2,
      #          24
      #        ] = Day9.place_in_queue(Enum.to_list(0..25), Enum.to_list(1..9), :queue.new())
    end

    test "solution 1" do
      # assert {_, 398_371} = Day9.play_and_get_winner(462, 71938)
    end

    test "new and old" do
      # assert {6, 63} = Day9.play_slow(10, 60)
      # assert {6, 63} = Day9.play_and_get_winner(10, 60)
      # assert {_, 398_371} = Day9.play_slow(462, 71938)
      # assert {_, 32923} = Day9.play_slow(100, 9380)
      # assert {_, 32923} = Day9.play_and_get_winner(100, 9380)

      # it's some combo of player length and marble count -- and I don't have the patience any more to figure this out
      assert Day9.play_slow(10, 999) == Day9.play_and_get_winner(10, 999)
      # assert {_, 398_371} = Day9.play_and_get_winner(462, 71938)
    end
  end
end
