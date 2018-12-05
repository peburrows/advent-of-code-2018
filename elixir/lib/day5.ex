defmodule Advent.Day5 do
  @input File.read!("#{__DIR__}/../../inputs/day5.txt")

  def problem1 do
    @input
    |> react()
    |> String.length()
  end

  def problem2 do
    split = String.split(@input, "", trim: true)

    Enum.map(?a..?z, fn char ->
      Task.async(fn ->
        split
        |> remove(char)
        |> react([])
        |> Enum.count()
      end)
    end)
    |> Enum.map(&Task.await/1)
    |> Enum.min()
  end

  def remove(input, c) do
    c = to_string([c])

    Enum.reduce(input, [], fn char, acc ->
      case String.downcase(char) do
        ^c -> acc
        _ -> [char | acc]
      end
    end)
    |> Enum.reverse()
  end

  def react(input) when is_binary(input) do
    input
    |> String.split("", trim: true)
    |> react([])
    |> Enum.join("")
  end

  def react([], acc), do: acc |> Enum.reverse()

  def react([head | tail], []) do
    react(tail, [head])
  end

  def react([head | tail], [acc_head | acc_tail] = acc) do
    if reactive?(head, acc_head),
      do: react(tail, acc_tail),
      else: react(tail, [head | acc])
  end

  def reactive?(a, b) when a == b, do: false

  def reactive?(a, b) do
    String.downcase(a) == b || String.upcase(a) == b
  end
end
