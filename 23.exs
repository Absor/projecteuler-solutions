# A perfect number is a number for which the sum of its proper divisors is
# exactly equal to the number. For example, the sum of the proper divisors of
# 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
#
# A number n is called deficient if the sum of its proper divisors is less than
# n and it is called abundant if this sum exceeds n.
#
# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest
# number that can be written as the sum of two abundant numbers is 24. By
# mathematical analysis, it can be shown that all integers greater than 28123
# can be written as the sum of two abundant numbers. However, this upper limit
# cannot be reduced any further by analysis even though it is known that the
# greatest number that cannot be expressed as the sum of two abundant numbers
# is less than this limit.
#
# Find the sum of all the positive integers which cannot be written as the sum
# of two abundant numbers.

defmodule Divisors do
  def proper_divisors(1), do: []
  def proper_divisors(n), do: [1 | proper_divisors(2, n, :math.sqrt(n))]
  defp proper_divisors(lower, _, upper) when lower > upper, do: []
  defp proper_divisors(lower, n, upper) when rem(n, lower) > 0, do: proper_divisors(lower + 1, n, upper)
  defp proper_divisors(lower, n, upper) when lower * lower == n, do: [lower | proper_divisors(lower + 1, n, upper)]
  defp proper_divisors(lower, n, upper), do: [lower, div(n, lower) | proper_divisors(lower + 1, n, upper)]
end

abundants = 2..28123
  |> Enum.map(fn n ->
    {n, Enum.sum(Divisors.proper_divisors(n))}
  end)
  |> Enum.filter(fn {n, s} ->
    s > n
  end)
  |> Enum.map(fn {n, _} ->
    n
  end)
  |> Enum.uniq()

abundant_sums = abundants
  |> Enum.flat_map(fn n1 ->
    abundants
      |> Stream.drop_while(fn n2 ->
        n2 < n1
      end)
      |> Stream.map(fn n2 ->
        n1 + n2
      end)
      |> Enum.take_while(fn sum ->
        sum <= 28123
      end)
  end)
  |> Enum.into(MapSet.new())

MapSet.new(1..28123) |> MapSet.difference(abundant_sums) |> Enum.sum() |> IO.inspect()
