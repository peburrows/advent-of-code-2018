defmodule Advent.Day4Test do
  use ExUnit.Case
  alias Advent.Day4
  # I've scrambled this so we can ensure we sort properly
  @test_input """
  [1518-11-01 00:05] falls asleep
  [1518-11-01 23:58] Guard #99 begins shift
  [1518-11-01 00:25] wakes up
  [1518-11-02 00:50] wakes up
  [1518-11-01 00:30] falls asleep
  [1518-11-01 00:55] wakes up
  [1518-11-05 00:55] wakes up
  [1518-11-02 00:40] falls asleep
  [1518-11-03 00:05] Guard #10 begins shift
  [1518-11-03 00:24] falls asleep
  [1518-11-01 00:00] Guard #10 begins shift
  [1518-11-03 00:29] wakes up
  [1518-11-04 00:02] Guard #99 begins shift
  [1518-11-04 00:36] falls asleep
  [1518-11-04 00:46] wakes up
  [1518-11-05 00:03] Guard #99 begins shift
  [1518-11-05 00:45] falls asleep
  """

  describe "problem 1" do
    test "case 1" do
      assert 240 == Day4.guard_times_minute(@test_input)
    end

    test "solution" do
      assert 67558 == Day4.problem1()
    end
  end

  describe "problem 2" do
    test "case 1" do
      assert 4455 == Day4.guard_consistent_minute(@test_input)
    end

    test "solution" do
      assert 78990 == Day4.problem2()
    end
  end
end
