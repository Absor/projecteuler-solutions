# A permutation is an ordered arrangement of objects. For example, 3124 is one
# possible permutation of the digits 1, 2, 3 and 4. If all of the permutations
# are listed numerically or alphabetically, we call it lexicographic order. The
# lexicographic permutations of 0, 1 and 2 are:
#
# 012   021   102   120   201   210
#
# What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4,
# 5, 6, 7, 8 and 9?

digits = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

defmodule Permutations do
  def permutations([]), do: [""]
  def permutations(list) do
    list
      |> Enum.sort()
      |> permutations("")
  end
  defp permutations([], acc), do: [acc]
  defp permutations(list, acc) do
    list
      |> Stream.with_index()
      |> Stream.flat_map(fn {n, i} ->
        others = List.delete_at(list, i)
        permutations(others, acc <> n)
      end)
  end
end

digits |> Permutations.permutations() |> Enum.at(1000000 - 1) |> IO.inspect()
