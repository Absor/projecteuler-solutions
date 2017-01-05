# Starting in the top left corner of a 2×2 grid, and only being able to move to
# the right and down, there are exactly 6 routes to the bottom right corner.
#
# https://projecteuler.net/project/images/p015.gif
#
# How many such routes are there through a 20×20 grid?

defmodule Routes do
  def count(n) do
    # Count routes in every intersection
    # Top most row is 2, 1, 1, ...
    # First column is 2, 1, 1, ...
    # Count everything in 1,1 -> n,n area seeded by 1,n of first row
    # (ones only). n,n will hold the result.

    first_row = List.duplicate(1, n)

    a = Enum.scan(0 .. n - 1, first_row, fn _, acc ->
      Enum.scan(acc, 1, fn m, acc2 ->
        m + acc2
      end)
    end)

    List.last List.last a
  end
end

IO.inspect Routes.count(20)
