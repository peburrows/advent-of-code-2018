defmodule Advent.Day6 do
  @input File.read!("#{__DIR__}/../../inputs/day6.txt")

  def problem1,
    do: @input |> largest

  def problem2,
    do: @input |> safe_space(10_000)

  def safe_space(input, within) when is_binary(input) do
    input
    |> String.split("\n", trim: true)
    |> safe_space(within)
  end

  def safe_space(input, within) do
    coords = extract_coordinates(input, [])
    {width, height} = extract_grid_dimensions(coords, {0, 0})

    Enum.reduce(0..height, %{}, fn y, acc ->
      Enum.reduce(0..width, acc, fn x, acc ->
        distances =
          Enum.reduce(coords, [], fn coord, distances ->
            [distance(coord, {x, y}) | distances]
          end)

        Map.put(acc, {x, y}, distances)
      end)
    end)
    |> Enum.reduce(0, fn {_, d}, acc ->
      if Enum.sum(d) < within, do: acc + 1, else: acc
    end)
  end

  def largest(input) when is_binary(input) do
    input
    |> String.split("\n", trim: true)
    |> largest
  end

  def largest(input) do
    coords = extract_coordinates(input, [])
    {width, height} = extract_grid_dimensions(coords, {0, 0})

    # {width, height} = {1000, 1000}

    # assign each point to the closest coordinate
    {results, edge_coords} = extract_closest_points(coords, {width, height})

    # now, eliminate the coords that have edge points (inifinit size)
    # and find the one with the most associated points
    candidates =
      results
      |> Map.keys()
      |> MapSet.new()
      |> MapSet.difference(edge_coords)

    Enum.reduce(candidates, {nil, 0}, fn coord, {_, max} = acc ->
      count = Enum.count(Map.get(results, coord, []))

      if count > max,
        do: {coord, count},
        else: acc
    end)
  end

  def extract_closest_points(coords, {width, height}) do
    Enum.reduce(0..height, {%{}, MapSet.new()}, fn y, acc ->
      Enum.reduce(0..width, acc, fn x, {map, set} = acc ->
        case closest(coords, {x, y}) do
          {:conflict, _} ->
            acc

          {point, _} ->
            set =
              if edge_point?({x, y}, {width, height}),
                do: MapSet.put(set, point),
                else: set

            {
              Map.update(map, point, [{x, y}], &[{x, y} | &1]),
              set
            }
        end
      end)
    end)
  end

  defp extract_coordinates([], acc), do: acc |> Enum.reverse()

  defp extract_coordinates([head | tail], acc) do
    coords =
      head
      |> String.split(", ")
      |> Enum.map(&String.to_integer/1)

    extract_coordinates(tail, [List.to_tuple(coords) | acc])
  end

  defp extract_grid_dimensions([], acc), do: acc

  defp extract_grid_dimensions([{x, y} | tail], {width, height}),
    do: extract_grid_dimensions(tail, {max(x, width), max(y, height)})

  def edge_point?({x, y}, {width, height}) do
    case {x, y} do
      {^width, _} -> true
      {_, ^height} -> true
      {x, y} when x <= 0 or y <= 0 -> true
      _ -> false
    end
  end

  def distance({x1, y1}, {x2, y2}),
    do: abs(x1 - x2) + abs(y1 - y2)

  def closest(list, point) do
    # :infinity is larger than any int because of comparison ordering
    # number < atom is always true
    [{ca, da}, {cb, db} | _tail] =
      Enum.reduce(list, [], fn coord, acc ->
        [{coord, distance(coord, point)} | acc]
      end)
      |> Enum.sort_by(fn {_coord, d} -> d end)

    if da == db,
      do: {:conflict, nil},
      else: {ca, da}
  end
end
