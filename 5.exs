# 2520 is the smallest number that can be divided by each of the numbers from 1
# to 10 without any remainder.
#
# What is the smallest positive number that is evenly divisible by all of the
# numbers from 1 to 20?

divisibles = Stream.unfold(2520, &({&1, &1 + 1}))
  |> Stream.filter(&rem(&1, 20) == 0)
  |> Stream.filter(&rem(&1, 19) == 0)
  |> Stream.filter(&rem(&1, 18) == 0)
  |> Stream.filter(&rem(&1, 17) == 0)
  |> Stream.filter(&rem(&1, 16) == 0)
  |> Stream.filter(&rem(&1, 15) == 0)
  |> Stream.filter(&rem(&1, 14) == 0)
  |> Stream.filter(&rem(&1, 13) == 0)
  |> Stream.filter(&rem(&1, 12) == 0)
  |> Stream.filter(&rem(&1, 11) == 0)

IO.puts Enum.at(divisibles, 0)
