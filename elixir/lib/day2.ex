defmodule Advent.Day2 do
  @input File.read!("#{__DIR__}/../../inputs/day2.txt") |> String.split("\n")

  def problem1,
    do: @input |> checksum |> IO.inspect()

  def problem2,
    do: @input |> overlap |> IO.inspect()

  def checksum(inputs) do
    results = inputs |> tally
    Map.get(results, 2, 0) * Map.get(results, 3, 0)
  end

  def tally(inputs) when is_list(inputs) do
    Enum.reduce(inputs, %{}, fn str, acc ->
      str
      |> tally
      |> Enum.reduce(acc, fn {count, val}, acc ->
        case val do
          nil -> acc
          num -> Map.put(acc, count, Map.get(acc, count, 0) + 1)
        end
      end)
    end)
  end

  def tally(str) do
    str
    |> String.codepoints()
    |> Enum.reduce(%{}, fn c, acc ->
      case acc[c] do
        nil -> Map.put(acc, c, 1)
        num -> Map.put(acc, c, num + 1)
      end
    end)
    |> Enum.reduce(%{}, fn {_letter, count}, acc ->
      case count do
        num when num >= 2 -> Map.put(acc, num, 1)
        _ -> acc
      end
    end)
  end

  # this is pretty naive
  def overlap(inputs) do
    Enum.reduce_while(inputs, %{processed: []}, fn str, %{processed: processed} = acc ->
      case processed do
        [] ->
          {:cont, %{processed: [str]}}

        prev ->
          prev
          |> Enum.find(fn p ->
            differences(str, p) |> length == 1
          end)
          |> case do
            nil ->
              {:cont, %{processed: [str | processed]}}

            found ->
              to_remove = differences(str, found) |> hd

              # we call String.codepoints multiple times on each string
              # we could be better about only calling it once
              final =
                str
                |> String.codepoints()
                |> List.delete_at(to_remove)
                |> Enum.join()

              {:halt, final}
          end
      end
    end)
  end

  defp differences(a, b) do
    al = String.codepoints(a)
    bl = String.codepoints(b)

    al
    |> Enum.with_index()
    |> Enum.reduce([], fn {a_letter, i}, acc ->
      if a_letter != Enum.at(bl, i) do
        [i | acc]
      else
        acc
      end
    end)
    |> Enum.reverse()
  end
end
