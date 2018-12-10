defmodule Advent.Day9 do
  def play(players, marbles) do
    # we can ignore players for now, just see if we can build up the board
    marbles =
      0..marbles
      |> Enum.to_list()

    players = 1..players |> Enum.to_list()

    play_with_queue(marbles, players, :queue.new(), %{})
    # play_with_queue(marbles, players, :queue.new(), nil}, %{})
  end

  def play_slow(players, marbles) do
    marbles = 0..marbles |> Enum.to_list()
    players = 1..players |> Enum.to_list()
    {scores, q} = place_marble(marbles, players, {_scores = %{}, _board = []})
    q |> Enum.count() |> IO.inspect(label: :slow_len)
    Enum.max_by(scores, fn {_k, v} -> v end)
  end

  def play_and_get_winner(players, marbles) do
    {scores, _} = play(players, marbles)
    # scores = play(players, marbles)
    Enum.max_by(scores, fn {_k, v} -> v end)
  end

  def play_with_queue([], _players, q, scores) do
    IO.inspect(:queue.len(q), label: :length)
    {scores, q}
  end

  def play_with_queue([first, next | tail], [player | rest], {[], []} = q, scores) do
    q = :queue.in(first, q)
    q = :queue.in(next, q)
    # IO.puts("player: #{player}")
    play_with_queue(tail, rest ++ [player], q, scores)
  end

  def play_with_queue([next | tail], [player | rest], q, scores) when rem(next, 23) == 0 do
    IO.puts("player: #{player} ***")

    {[rem | keep], q} =
      Enum.reduce(1..7, {[], q}, fn _, {acc, q} ->
        {{:value, i}, q} = :queue.out(q)
        {[i | acc], q}
      end)

    # |> IO.inspect(label: :remove)

    # now, with each of those, we should put them at the front with in_r...?
    q =
      Enum.reduce(keep, q, fn i, q ->
        :queue.in(i, q)
      end)

    # |> IO.inspect()

    scores = Map.update(scores, player, rem + next, &(rem + next + &1))

    play_with_queue(tail, rest ++ [player], q, scores)
  end

  def play_with_queue([next | tail], [player | rest], q, scores) do
    # IO.puts("player: #{player}")
    {{:value, head}, q} = :queue.out_r(q)
    {{:value, trailer}, q} = :queue.out_r(q)
    q = :queue.in_r(head, q)
    q = :queue.in_r(trailer, q)
    play_with_queue(tail, rest ++ [player], :queue.in(next, q), scores)
  end

  def place_marble([], _players, acc, _), do: acc

  def place_marble([next | tail], players, {scores, [] = board} = acc) do
    place_marble(tail, players, {scores, board ++ [next]}, 0)
  end

  def place_marble([next | tail], [player | rest], {scores, acc}, last) when rem(next, 23) == 0 do
    # for now, just skip it, and remove the one 7 to the left
    # IO.inspect({next, scores, acc})

    # IO.puts("resetting!")
    to_remove =
      if last - 7 < 0 do
        # IO.inspect("wrapping around", label: :"23")
        length(acc) - abs(last - 7)
      else
        # I don't think this will ever be out of range
        last - 7
      end

    to_add = Enum.at(acc, to_remove) + next
    # IO.inspect({to_add, player})
    scores = Map.update(scores, player, to_add, &(to_add + &1))
    place_marble(tail, rest ++ [player], {scores, List.delete_at(acc, to_remove)}, to_remove)
  end

  def place_marble([next | tail], [player | rest], {scores, acc}, last) do
    where =
      if last + 2 > length(acc) do
        # IO.inspect("wrapping! #{next}", label: :place)
        last + 2 - length(acc)
      else
        last + 2
      end

    place_marble(tail, rest ++ [player], {scores, List.insert_at(acc, where, next)}, where)
  end
end
