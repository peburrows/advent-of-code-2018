defmodule Advent.Day1 do
  @input File.read!("#{__DIR__}/input.txt") |> String.split("\n")

  def problem1 do
    find_frequency(0, @input)
  end

  def problem2 do
    find_repeated(0, @input)
  end

  def find_frequency(start, inputs) do
    Enum.reduce(inputs, start, fn i, acc ->
      next(acc, i)
    end)
  end

  def find_repeated(start, input, results \\ %{0 => true}) do
    Enum.reduce_while(input, {start, results}, fn i, {acc, res} ->
      acc = next(acc, i)

      if res[acc] do
        {:halt, {:found, acc}}
      else
        {:cont, {acc, Map.put(res, acc, true)}}
      end
    end)
    |> case do
      {:found, val} -> val
      {acc, r} -> find_repeated(acc, input, r)
    end
  end

  defp next(acc, num) do
    acc + String.to_integer(num)
  end
end
