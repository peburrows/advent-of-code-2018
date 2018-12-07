defmodule Advent.Day7 do
  @input File.read!("#{__DIR__}/../../inputs/day7.txt")

  def problem1,
    do: order_steps(@input)

  def problem2,
    do: time(@input, 60, 5)

  def order_steps(input) when is_binary(input) do
    input
    |> String.split("\n", trim: true)
    |> order_steps
  end

  def order_steps(lines) do
    instructions = extract_instructions(lines, [])

    # turn the instructions into a map of prereqs:
    # essentially, before X, [Z, Y, B] must be completed
    prereqs = build_dependency_graph(instructions)

    {path, _, _} =
      Enum.reduce(
        prereqs,
        {[], prereqs, []},
        fn _, {acc, prereqs, prev_options} ->
          possibles =
            Enum.filter(prereqs, fn
              {_, []} -> true
              _ -> false
            end)
            |> Map.new()
            |> Map.keys()

          [next | rest] = (possibles ++ prev_options) |> Enum.uniq() |> Enum.sort()

          # remove the prereq from all other prereq lists
          prereqs =
            Enum.reduce(prereqs, %{}, fn
              {^next, _}, acc -> acc
              {k, list}, acc -> Map.put(acc, k, List.delete(list, next))
            end)

          {[next | acc], prereqs, rest}
        end
      )

    path |> Enum.reverse() |> Enum.join()
  end

  def extract_instructions([], acc), do: acc

  def extract_instructions([head | tail], acc) do
    extract_instructions(tail, [{String.slice(head, 36, 1), String.slice(head, 5, 1)} | acc])
  end

  def time(input, offset, worker_count) do
    graph =
      input
      |> String.split("\n", trim: true)
      |> extract_instructions([])
      |> build_dependency_graph
      |> work(offset, worker_count)

    # then for each step, iterate over the workers and either assign them a step or decrement their counter
  end

  defmodule Timeline do
    defstruct workers: [],
              worker_count: 5,
              offset: 0,
              processed: [],
              previous_candidates: [],
              graph: %{},
              duration: 0
  end

  def work(graph, offset, worker_count) do
    tick(%Timeline{
      graph: graph,
      workers: [],
      worker_count: worker_count,
      offset: offset
    })
  end

  def tick(%{graph: g, workers: [], duration: duration})
      when map_size(g) == 0,
      do: duration

  def tick(
        %{
          graph: graph,
          processed: processed
        } = timeline
      ) do
    timeline
    |> remove_processed_from_prereqs
    |> add_available_work
    |> decrement_and_filter_active_workers
    |> increment_timer
    |> tick
  end

  def remove_processed_from_prereqs(%{processed: []} = timeline),
    do: timeline

  def remove_processed_from_prereqs(%{processed: processed, graph: graph} = timeline) do
    graph =
      Enum.reduce(processed, graph, fn l, graph ->
        Enum.reduce(graph, %{}, fn {k, list}, graph ->
          Map.put(graph, k, List.delete(list, l))
        end)
      end)

    %{timeline | graph: graph}
  end

  def add_available_work(
        %{
          graph: graph,
          offset: offset,
          workers: workers,
          worker_count: wcount,
          previous_candidates: prev
        } = timeline
      )
      when length(workers) < wcount do
    options =
      Enum.flat_map(graph, fn
        {k, []} -> [k]
        _ -> []
      end)

    options =
      (options ++ prev)
      |> Enum.sort()
      |> Enum.uniq()

    # but we can only work on as many workers as we have free
    {workers, left, _} =
      Enum.reduce(
        options,
        {workers, options, length(workers)},
        fn
          letter, {workers, [_head | leftover], count} when count < wcount ->
            {[{letter, step_duration(letter, offset)} | workers], leftover, count + 1}

          _letter, acc ->
            acc
        end
      )

    pruned_graph =
      Enum.reduce(workers, graph, fn {l, _}, graph ->
        Map.delete(graph, l)
      end)

    %{
      timeline
      | workers: workers,
        previous_candidates: left,
        graph: pruned_graph
    }
  end

  def add_available_work(timeline), do: timeline

  def decrement_and_filter_active_workers(%{workers: []} = timeline), do: timeline

  def decrement_and_filter_active_workers(%{workers: workers, processed: processed} = timeline) do
    {workers, completed} =
      Enum.reduce(workers, {[], processed}, fn
        {l, i}, {w, processed} when i == 1 -> {w, [l | processed]}
        {l, i}, {workers, p} -> {[{l, i - 1} | workers], p}
      end)

    %{timeline | workers: workers, processed: completed}
  end

  defp increment_timer(%{duration: d} = acc), do: %{acc | duration: d + 1}

  def step_duration(letter, offset \\ 0) do
    (String.to_charlist(letter) |> hd) - 64 + offset
  end

  def build_dependency_graph(instructions) do
    # left, or only have the current step as a prereq
    all =
      instructions
      |> Enum.reduce(MapSet.new(), fn {pre, post}, acc ->
        acc
        |> MapSet.put(pre)
        |> MapSet.put(post)
      end)
      |> Enum.map(&{&1, []})
      |> Enum.into(%{})

    Enum.reduce(instructions, all, fn {pre, post}, acc ->
      Map.update(acc, pre, [post], &[post | &1])
    end)
  end
end
