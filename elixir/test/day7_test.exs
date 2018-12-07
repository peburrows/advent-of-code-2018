defmodule Advent.Day7Test do
  use ExUnit.Case
  alias Advent.Day7

  @input """
  Step C must be finished before step A can begin.
  Step C must be finished before step F can begin.
  Step A must be finished before step B can begin.
  Step A must be finished before step D can begin.
  Step B must be finished before step E can begin.
  Step D must be finished before step E can begin.
  Step F must be finished before step E can begin.
  """

  describe "problem 1" do
    test "case 1" do
      assert "CABDFE" == Day7.order_steps(@input)
    end

    test "solution" do
      assert "BITRAQVSGUWKXYHMZPOCDLJNFE" == Day7.problem1()
    end
  end

  describe "problem 2" do
    test "step duration" do
      assert 1 == Day7.step_duration("A")
      assert 61 == Day7.step_duration("A", 60)
      assert 26 == Day7.step_duration("Z")
    end

    test "case 1" do
      assert 15 == Day7.time(@input, _offset = 0, _workers = 2)

      assert 25 == Day7.time(@input, 2, 2)
    end
  end
end

#   -->A--->B--
# /    \       \
# C      -->D----->E
# \           /
#  ---->F-----

# A = 3
# B = 4
# C = 5
# D = 6
# E = 7
# F = 8

# 1   2   DONE
# ------------
# C
# C
# C
# C
# C
# A   F   C
# A   F
# A   F
# B   F   CA
# B   F
# B   F
# B   F
# D   F   CAB
# D       CABF
# D
# D
# D
# D
# E      CABFD
# E
# E
# E
# E
# E
# E
# .       CABFDE
