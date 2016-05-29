# The prime factors of 13195 are 5, 7, 13 and 29.
#
# What is the largest prime factor of the number 600851475143 ?

prime? = fn n ->
  Enum.all?(2..n-1, fn x -> rem(n, x) != 0 end)
end

prime_factors = 2..600851475143
  |> Stream.filter(&rem(600851475143, &1) == 0)
  |> Stream.map(&(div(600851475143, &1)))
  |> Stream.filter(prime?)

IO.puts Enum.at(prime_factors, 0)
