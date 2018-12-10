defmodule Advent.Day10 do
  @input File.read!("#{__DIR__}/../../inputs/day10.txt")

  def problem1 do
    {area, iteration, points} = minimum_area(@input)
    print(points)
  end

  def problem2 do
    {area, iteration, points} = minimum_area(@input)
    iteration
  end

  def parse(input) do
    r = ~r/<\s*([\-\d]+),\s+([\-\d]+)>/

    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn line ->
      [p, v] = String.split(line, ["position=", "velocity="], trim: true)
      [_, px, py] = Regex.run(r, p)
      [_, vx, vy] = Regex.run(r, v)
      [px, py, vx, vy] = Enum.map([px, py, vx, vy], &String.to_integer/1)

      {
        {px, py},
        {vx, vy}
      }
    end)
  end

  def minimum_area(input) when is_binary(input) do
    input
    |> parse
    |> minimum_area
  end

  def minimum_area(input) do
    Enum.reduce_while(
      0..2_000_000,
      {:infinity, 0, input, input},
      fn i, {prev, prev_i, prev_input, input} = acc ->
        area = calculate_area(input)

        if area < prev do
          moved_input = move(input)
          {:cont, {area, i, input, moved_input}}
        else
          {:halt, {prev, prev_i, prev_input}}
        end
      end
    )
  end

  def calculate_area(input) do
    %{
      min_x: min_x,
      min_y: min_y,
      max_x: max_x,
      max_y: max_y
    } = min_max(input)

    (max_x - min_x + 1) * (max_y - min_y + 1)
  end

  def min_max(input) do
    {{{min_x, _}, _}, {{max_x, _}, _}} = Enum.min_max_by(input, fn {{x, _}, _} -> x end)

    {{{_, min_y}, _}, {{_, max_y}, _}} = Enum.min_max_by(input, fn {{_, y}, _} -> y end)

    %{min_x: min_x, min_y: min_y, max_x: max_x, max_y: max_y}
  end

  def move(input) do
    Enum.reduce(input, [], fn {{x, y}, {dx, dy}}, acc ->
      [{{x + dx, y + dy}, {dx, dy}} | acc]
    end)
  end

  def print(input) do
    # first, we need to place points in a grid
    %{min_x: min_x, min_y: min_y, max_x: max_x, max_y: max_y} = min_max(input)

    # sort by row first, then column
    input =
      input
      |> Enum.sort_by(fn {{x, y}, _} -> {y, x} end)
      |> Enum.uniq_by(&elem(&1, 0))

    Enum.reduce(min_y..max_y, input, fn y, input ->
      IO.puts("")

      Enum.reduce(min_x..max_x, input, fn
        x, [{{hd_x, hd_y}, _} | tail] = points ->
          if hd_x == x && hd_y == y do
            IO.write("#")
            tail
          else
            IO.write(".")
            points
          end

        x, _points ->
          IO.write(".")
          []
      end)
    end)
  end

  def print_at(input, iteration) do
    Enum.reduce(1..iteration, input, fn _, input ->
      move(input)
    end)
    |> print
  end
end
