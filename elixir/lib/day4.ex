defmodule Advent.Day4 do
  @input File.read!("#{__DIR__}/../../inputs/day4.txt")
  def problem1, do: guard_times_minute(@input)
  def problem2, do: guard_consistent_minute(@input)

  def guard_times_minute(input) when is_binary(input) do
    input
    |> String.split("\n", trim: true)
    |> guard_times_minute
  end

  def guard_times_minute(inputs) do
    inputs
    |> Enum.sort()
    |> parse()
    |> tally
    |> calculate_worst
  end

  def guard_consistent_minute(inputs) when is_binary(inputs) do
    inputs
    |> String.split("\n", trim: true)
    |> guard_consistent_minute
  end

  def guard_consistent_minute(inputs) do
    inputs
    |> Enum.sort()
    |> parse
    |> tally
    |> calculate_high_minute_guard
  end

  defp parse(list, acc \\ %{}, guard \\ nil)
  defp parse([], acc, _guard), do: acc

  defp parse([head | tail], acc, guard) do
    {ts, data, g} = parse_one(head, guard)
    parse(tail, Map.update(acc, g, [{ts, data}], &[{ts, data} | &1]), g)
  end

  defp parse_one(
         <<"[", year::binary-size(4), "-", month::binary-size(2), "-", day::binary-size(2), " ",
           hour::binary-size(2), ":", minute::binary-size(2), "] ", data::binary>> = _ts,
         guard
       ) do
    guard =
      case Regex.run(~r/#(\d+)/, data) do
        [_, g] -> g
        _ -> guard
      end

    ts =
      [year, month, day, hour, minute]
      |> Enum.map(&String.to_integer/1)
      |> List.to_tuple()

    {ts, data, guard}
  end

  def tally(guard_records) do
    Enum.reduce(guard_records, %{}, fn {g, records}, acc ->
      {_, total} =
        records
        |> Enum.reverse()
        |> Enum.reduce({0, []}, fn
          {{_, _, _, _, m}, <<"falls", _::binary>>}, {_, all} ->
            {m, all}

          {{_, _, _, _, m}, <<"wakes", _::binary>>}, {prev, all} ->
            {m, all ++ (prev..(m - 1) |> Enum.to_list())}

          _, acc ->
            acc
        end)

      Map.put(acc, g, total)
    end)
  end

  def calculate_worst(tallied) do
    {_total_min, {g, records}} =
      Enum.reduce(tallied, {0, nil}, fn {id, mins}, {num, _} = acc ->
        if num < length(mins) do
          {length(mins), {id, mins}}
        else
          acc
        end
      end)

    {min, _} =
      records
      |> Enum.reduce(%{}, fn m, acc ->
        Map.update(acc, m, 1, &(1 + &1))
      end)
      |> Enum.reduce({nil, 0}, fn {m, c}, {_, max} = acc ->
        if c > max, do: {m, c}, else: acc
      end)

    min * String.to_integer(g)
  end

  def calculate_high_minute_guard(tallied) do
    {_, min, guard_id} =
      tallied
      |> Enum.reduce({0, nil, nil}, fn {id, mins}, {max, _minute, _guard} = acc ->
        {new_max, m} =
          mins
          |> Enum.reduce(%{}, fn m, inner ->
            Map.update(inner, m, 1, &(1 + &1))
          end)
          |> Enum.reduce({0, nil}, fn {m, count}, {max, _found} = acc ->
            if count > max, do: {count, m}, else: acc
          end)

        if new_max > max, do: {new_max, m, id}, else: acc
      end)

    min * String.to_integer(guard_id)
  end
end
