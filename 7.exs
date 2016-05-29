# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
# that the 6th prime is 13.
#
# What is the 10 001st prime number?

prime? = fn n ->
  if n == 2 do
    true
  else
    Enum.all?(2..n-1, fn x -> rem(n, x) != 0 end)
  end
end

IO.puts Stream.unfold(2, fn n -> {n, n + 1} end)
  |> Stream.filter(prime?)
  |> Enum.at(10000) # 0-based
