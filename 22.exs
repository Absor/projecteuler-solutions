# Using names.txt (right click and 'Save Link/Target As...'), a 46K text file
# containing over five-thousand first names, begin by sorting it into
# alphabetical order. Then working out the alphabetical value for each name,
# multiply this value by its alphabetical position in the list to obtain a name
# score.
#
# For example, when the list is sorted into alphabetical order, COLIN, which is
# worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN
# would obtain a score of 938 × 53 = 49714.
#
# What is the total of all the name scores in the file?

File.read!("files/p022_names.txt")
  |> String.split(",")
  |> Enum.map(&String.replace(&1, "\"", ""))
  |> Enum.sort
  |> Enum.map(fn name ->
    name
      |> String.codepoints
      |> Enum.map(fn code ->
        <<intval::utf8>> = code
        intval - 64 # A is 65
      end)
      |> Enum.sum
  end)
  |> Enum.with_index
  |> Enum.map(fn {name_val, index} ->
    name_val * (index + 1)
  end)
  |> Enum.sum
  |> IO.inspect
