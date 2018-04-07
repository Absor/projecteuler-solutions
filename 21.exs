# Let d(n) be defined as the sum of proper divisors of n (numbers less than n
# which divide evenly into n).
# If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and
# each of a and b are called amicable numbers.
#
# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44,
# 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4,
# 71 and 142; so d(284) = 220.
#
# Evaluate the sum of all the amicable numbers under 10000.

defmodule Divisors do
  def proper_divisors(1), do: []
  def proper_divisors(n), do: [1 | proper_divisors(2, n, :math.sqrt(n))]
  defp proper_divisors(lower, _, upper) when lower > upper, do: []
  defp proper_divisors(lower, n, upper) when rem(n, lower) > 0, do: proper_divisors(lower + 1, n, upper)
  defp proper_divisors(lower, n, upper) when lower * lower == n, do: [lower | proper_divisors(lower + 1, n, upper)]
  defp proper_divisors(lower, n, upper), do: [lower, div(n, lower) | proper_divisors(lower + 1, n, upper)]
end


2..10000
  |> Stream.transform(MapSet.new(2..10000), fn n1, acc ->
    cond do
      MapSet.size(acc) < 2 ->
        {:halt, acc}

      MapSet.member?(acc, n1) ->
        n2 = Enum.sum(Divisors.proper_divisors(n1))

        if n1 != n2 and MapSet.member?(acc, n2) and Enum.sum(Divisors.proper_divisors(n2)) == n1 do
          {[n1, n2], acc |> MapSet.delete(n1) |> MapSet.delete(n2)}
        else
          {[], acc |> MapSet.delete(n1) |> MapSet.delete(n2)}
        end

      true ->
        {[], acc}
    end
  end)
  |> Enum.sum()
  |> IO.inspect()
