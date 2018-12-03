defmodule Advent.Day3 do
  @input File.read!("#{__DIR__}/../../inputs/day3.txt")

  def problem1,
    do: @input |> overlapping_area |> IO.inspect()

  def problem2,
    do: @input |> no_overlap |> IO.inspect()

  def overlapping_area(input) do
    {area, _ids} =
      input
      |> String.split("\n", trim: true)
      |> find_overlap()

    area
  end

  def find_overlap(inputs) do
    Enum.reduce(inputs, %{}, fn line, acc ->
      [id, x, y, w, h] = extract_claim(line)

      Enum.reduce(x..(x + w - 1), acc, fn dx, acc ->
        Enum.reduce(y..(y + h - 1), acc, fn dy, acc ->
          Map.update(acc, {dx, dy}, [id], &[id | &1])
        end)
      end)
    end)
    |> Enum.reduce({0, %{}}, fn
      {_, [_]}, acc ->
        acc

      {_, ids}, {count, prev} ->
        acc = Enum.reduce(ids, prev, fn i, m -> Map.put(m, i, true) end)
        {count + 1, acc}
    end)
  end

  def no_overlap(input) do
    lines =
      input
      |> String.split("\n", trim: true)

    {_, overlapped_ids} = find_overlap(lines)

    all_ids =
      Enum.reduce(lines, %{}, fn line, acc ->
        [id, _, _, _, _] = extract_claim(line)
        Map.put(acc, id, true)
      end)

    Enum.reduce_while(all_ids, nil, fn {id, _}, found ->
      if !overlapped_ids[id], do: {:halt, id}, else: {:cont, nil}
    end)
  end

  defp extract_claim(line) do
    reg = ~r/#(\d+) @ (\d+),(\d+): (\d+)x(\d+)/
    [_, id, x, y, w, h] = Regex.run(reg, line)
    int = &String.to_integer/1
    [id, int.(x), int.(y), int.(w), int.(h)]
  end
end
