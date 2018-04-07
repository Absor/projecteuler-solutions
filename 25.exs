# The Fibonacci sequence is defined by the recurrence relation:
#
# F_n = F_n−1 + F_n−2, where F_1 = 1 and F_2 = 1.
# Hence the first 12 terms will be:
#
# F1 = 1
# F2 = 1
# F3 = 2
# F4 = 3
# F5 = 5
# F6 = 8
# F7 = 13
# F8 = 21
# F9 = 34
# F10 = 55
# F11 = 89
# F12 = 144
# The 12th term, F12, is the first term to contain three digits.
#
# What is the index of the first term in the Fibonacci sequence to contain 1000
# digits?

Stream.concat(
  [1, 1],
  Stream.unfold({1, 1}, fn {n_1, n_2} ->
    n = n_1 + n_2
    {n, {n_2, n}}
  end)
)
  |> Stream.map(&Integer.to_string(&1))
  |> Stream.with_index
  |> Stream.filter(fn {str, _} ->
    String.length(str) >= 1000
  end)
  |> Stream.map(fn {_, index} ->
    index + 1
  end)
  |> Enum.at(0)
  |> IO.inspect
