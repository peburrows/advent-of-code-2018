defmodule Advent.Day8 do
  @input File.read!("#{__DIR__}/../../inputs/day8.txt")

  def problem1,
    do: metadata_sum(@input)

  def problem2,
    do: find_root_node_value(@input)

  def metadata_sum(input) when is_binary(input) do
    input
    |> String.split(" ", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> extract_nodes([], 0)
  end

  def extract_nodes([], _acc, sum), do: sum

  def extract_nodes([children, meta | rest], [], sum) do
    extract_nodes(rest, [{children, meta}], sum)
  end

  def extract_nodes([children, meta | rest], [{c, _} | _] = nodes, sum) when c > 0 do
    extract_nodes(rest, [{children, meta} | nodes], sum)
  end

  def extract_nodes([head | rest], [{c, m} | rest_nodes] = all, sum) when m > 0 do
    if m - 1 == 0 do
      # need to decrement the child nodes of the next node
      nodes =
        rest_nodes
        |> case do
          [{nc, nm} | rest_nodes] -> [{nc - 1, nm} | rest_nodes]
          other -> other
        end

      extract_nodes(rest, nodes, sum + head)
    else
      extract_nodes(rest, [{c, m - 1} | rest_nodes], sum + head)
    end
  end

  defmodule Tree do
    defstruct [
      :data,
      :child_count,
      :metadata_count,
      children: [],
      metadata: []
    ]
  end

  def find_root_node_value(input) when is_binary(input) do
    {root, _} =
      input
      |> String.split(" ", trim: true)
      |> Enum.map(&String.to_integer/1)
      |> build_tree()

    sum_node(root)
  end

  def sum_node(%{children: [], metadata: meta}) do
    Enum.sum(meta)
  end

  def sum_node(%{children: children, metadata: meta}) do
    Enum.reduce(meta, 0, fn i, acc ->
      case Enum.at(children, i - 1) do
        nil -> acc
        node -> acc + sum_node(node)
      end
    end)
  end

  def parse_input(input) do
    input
    |> String.split(" ", trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  def build_tree(input) do
    input
    |> extract_header
    |> extract_children
    |> extract_metadata
  end

  def extract_header([child_count, meta_count | tail]) do
    {%Tree{data: {child_count, meta_count}, child_count: child_count, metadata_count: meta_count},
     tail}
  end

  def extract_children({%Tree{child_count: 0, children: c} = tree, input}),
    do: {%{tree | children: Enum.reverse(c)}, input}

  def extract_children({%Tree{children: c, child_count: cc} = tree, input}) do
    {child, tail} = build_tree(input)

    extract_children({
      %{tree | children: [child | c], child_count: cc - 1},
      tail
    })
  end

  def extract_metadata({%Tree{metadata_count: 0, metadata: md} = tree, input}),
    do: {%{tree | metadata: Enum.reverse(md)}, input}

  def extract_metadata({%Tree{metadata: md, metadata_count: mc} = tree, [meta | tail]}) do
    extract_metadata({%{tree | metadata: [meta | md], metadata_count: mc - 1}, tail})
  end
end
