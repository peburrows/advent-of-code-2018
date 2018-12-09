defmodule Advent.Day8Test do
  use ExUnit.Case
  alias Advent.Day8
  @input "2 3 0 3 10 11 12 1 1 0 1 99 2 1 1 2"

  describe "problem 1" do
    test "case 1" do
      assert 138 = Day8.metadata_sum(@input)
    end

    test "solution" do
      assert 46962 == Day8.problem1()
    end
  end

  describe "problem 2" do
    alias Day8.Tree

    test "case 1" do
      assert 66 == Day8.find_root_node_value(@input)
    end

    test "building the tree" do
      assert {%Tree{
                data: {2, 3},
                children: [
                  %{data: {0, 3}},
                  %{
                    data: {1, 1},
                    children: [
                      %{
                        data: {0, 1}
                      }
                    ]
                  }
                ]
              }, []} = @input |> Day8.parse_input() |> Day8.build_tree()
    end
  end
end
