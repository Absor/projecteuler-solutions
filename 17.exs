# If the numbers 1 to 5 are written out in words: one, two, three, four, five,
# then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
#
# If all the numbers from 1 to 1000 (one thousand) inclusive were written out
# in words, how many letters would be used?
#
#
# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and
# forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20
# letters. The use of "and" when writing out numbers is in compliance with
# British usage.

units = [
  "one",
  "two",
  "three",
  "four",
  "five",
  "six",
  "seven",
  "eight",
  "nine",
]

teens = [
  "ten",
  "eleven",
  "twelve",
  "thirteen",
  "fourteen",
  "fifteen",
  "sixteen",
  "seventeen",
  "eighteen",
  "nineteen"
]

tens = [
  "twenty",
  "thirty",
  "forty",
  "fifty",
  "sixty",
  "seventy",
  "eighty",
  "ninety"
]

a_1_9 = String.length(Enum.join(units, "")) # 1-9

a_1_99 = a_1_9 +
         String.length(Enum.join(teens, "")) + # 10-19
         10 * String.length(Enum.join(tens, "")) + 8 * a_1_9 # 20-99

a_100_999 = String.length("hundred") * 900 + # 100-999 "hundred"
            String.length("and") * 891 + # 101-199, 201-299, ..., 901-999 "and"
            (
              units
                |> Enum.map(&String.length(&1))
                |> Enum.map(&(&1 * 100))
                |> Enum.sum
            ) + # 100-999 "one", "two", ..., "nine"
            9 * a_1_99

IO.inspect a_1_99 + a_100_999 + String.length("onethousand")
