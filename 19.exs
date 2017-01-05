# You are given the following information, but you may prefer to do some
# research for yourself.
#
# * 1 Jan 1900 was a Monday.
# * Thirty days has September,
#   April, June and November.
#   All the rest have thirty-one,
#   Saving February alone,
#   Which has twenty-eight, rain or shine.
#   And on leap years, twenty-nine.
# * A leap year occurs on any year evenly divisible by 4, but not on a century
#   unless it is divisible by 400.
#
# How many Sundays fell on the first of the month during the twentieth century
# (1 Jan 1901 to 31 Dec 2000)?

leap? = fn year ->
  cond do
    rem(year, 400) == 0 ->
      true
    rem(year, 100) == 0 ->
      false
    rem(year, 4) == 0 ->
      true
    true ->
      false
  end
end

1900..2000
  |> Enum.map(fn year ->
    feb = if leap?.(year), do: 29, else: 28

    [
      31, # Jan
      feb, # Feb
      31, # Mar
      30, # Apr
      31, # May
      30, # Jun
      31, # Jul
      31, # August
      30, # Sept
      31, # Oct
      30, # Nov
      31, # Dec
    ]
  end)
  # First sunday is the 7th
  |> Enum.flat_map_reduce(7, fn year_days, dom ->
    year_days
      |> Enum.map_reduce(dom, fn day_count, dom ->
        more = round(Float.ceil((day_count - dom + 1) / 7)) * 7
        day_in_next_month = rem(dom + more, day_count)
        {dom == 1, day_in_next_month}
      end)
  end)
  |> IO.inspect
  |> elem(0)
  |> Enum.drop(12) # 1900 (flattened)
  |> Enum.count(&(&1))
  |> IO.inspect
