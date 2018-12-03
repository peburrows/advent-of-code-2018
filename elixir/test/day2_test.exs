defmodule Advent.Day2Test do
  use ExUnit.Case

  describe "problem 1" do
    test "case 1" do
      assert %{} == Advent.Day2.tally("abcdef")
    end

    test "case 2" do
      assert %{2 => 1, 3 => 1} == Advent.Day2.tally("bababc")
    end

    test "case 3" do
      assert %{2 => 1} == Advent.Day2.tally("abbcde")
    end

    test "case 4" do
      assert %{3 => 1} == Advent.Day2.tally("abcccd")
    end

    test "case 5" do
      assert %{2 => 1} == Advent.Day2.tally("aabcdd")
    end

    test "case 6" do
      assert %{2 => 1} == Advent.Day2.tally("abcdee")
    end

    test "case 7" do
      assert %{3 => 1} == Advent.Day2.tally("ababab")
    end

    test "checksum" do
      inputs = [
        "abcdef",
        "bababc",
        "abbcde",
        "abcdee",
        "ababab",
        "abcccd",
        "aabcdd"
      ]

      assert %{2 => 4, 3 => 3} == Advent.Day2.tally(inputs)
      assert 12 == Advent.Day2.checksum(inputs)
    end
  end

  describe "problem 2" do
    test "case 1" do
      inputs = ~w(abcde fghij klmno pqrst fguij axcye wvxyz)
      assert "fgij" == Advent.Day2.overlap(inputs)
    end

    test "solution" do
      assert "efmyhuckqldtwjyvisipargno" == Advent.Day2.problem2()
    end
  end
end
