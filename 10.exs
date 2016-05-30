# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
#
# Find the sum of all the primes below two million.

# http://stackoverflow.com/questions/1801391/what-is-the-best-algorithm-for-
# checking-if-a-number-is-prime
defmodule Prime do
  def prime_helper(n, i, w) do
    cond do
      i * i <= n ->
        if rem(n, i) == 0 do
          false
        else
          prime_helper(n, i + w, 6 - w)
        end
      true -> true
    end
  end

  def prime?(n) do
    cond do
      n == 2 -> true
      n == 3 -> true
      rem(n, 2) == 0 -> false
      rem(n, 3) == 0 -> false
      true -> prime_helper(n, 5, 2)
    end
  end
end

2..2000000
  |> Enum.filter(&Prime.prime?(&1))
  |> Enum.sum
  |> IO.puts
