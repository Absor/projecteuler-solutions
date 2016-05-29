# A palindromic number reads the same both ways. The largest palindrome made
# from the product of two 2-digit numbers is 9009 = 91 × 99.
#
# Find the largest palindrome made from the product of two 3-digit numbers.

defmodule Tools do
  def palindrome?(ns, i) do
    e = String.length(ns) - 1 - i
    cond do
      e == i ->
        true
      e < i ->
        false
      e == i + 1 ->
        String.at(ns, i) == String.at(ns, e)
      String.at(ns, i) == String.at(ns, e) ->
        palindrome?(ns, i + 1)
      true ->
        false
    end
  end

  def palindrome?(n) do
    ns = "#{n}"
    palindrome?(ns, 0)
  end
end

palindromes = 999..900
  |> Stream.flat_map(fn number ->
    Stream.map(999..900, &(&1 * number))
  end)
  |> Stream.filter(&Tools.palindrome?(&1))

IO.puts Enum.at(palindromes, 0)
