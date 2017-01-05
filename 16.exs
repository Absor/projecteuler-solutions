# 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
#
# What is the sum of the digits of the number 2^1000?

# https://en.wikipedia.org/wiki/Exponentiation_by_squaring
# http://www.rookieslab.com/2013/05/fast-power-algorithm-cc-and-python-code.html
# http://stackoverflow.com/questions/32024156/how-do-i-raise-a-number-to-a-power-in-elixir/32030190

defmodule Pow do
  require Integer

  def pow(_, 0), do: 1

  def pow(x, n) when Integer.is_odd(n), do: x * pow(x, n - 1)

  def pow(x, n) do
    result = pow(x, div(n, 2))
    result * result
  end
end

IO.inspect Pow.pow(2, 1000)
  |> Integer.to_string
  |> String.codepoints
  |> Enum.map(&String.to_integer(&1))
  |> Enum.sum
