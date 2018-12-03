defmodule Advent.Day1 do
  @input File.read!("#{__DIR__}/../../inputs/day1.txt") |> String.split("\n")

  def problem1, do: find_frequency(0, @input) |> IO.inspect()

  def problem2, do: find_repeated(@input) |> IO.inspect()

  def find_frequency(start, inputs) do
    Enum.reduce(inputs, start, fn i, acc ->
      next(acc, i)
    end)
  end

  def find_repeated(input, start \\ 0, results \\ MapSet.new([0])) do
    Enum.reduce_while(input, {start, results}, fn i, {acc, res} ->
      acc = next(acc, i)

      if MapSet.member?(res, acc),
        do: {:halt, {:found, acc}},
        else: {:cont, {acc, MapSet.put(res, acc)}}
    end)
    |> case do
      {:found, val} -> val
      {acc, r} -> find_repeated(input, acc, r)
    end
  end

  defp next(acc, num) do
    acc + String.to_integer(num)
  end
end
