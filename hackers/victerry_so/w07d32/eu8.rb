# Largest product in a series
# Write a program that, when given a string of digits, can calculate the largest product for a series of consecutive digits of length n.
# For example, for the input '0123456789', the largest product for a series of 3 digits is 504 (7 * 8 * 9), and the largest product for a series of 5 digits is 15120 (5 * 6 * 7 * 8 * 9).
# For the input '73167176531330624919225119674426574742355349194934', the largest product is 23520.

number = '73167176531330624919225119674426574742355349194934'
n = 6
i = 0 # i is the iterating count for which index we're up to in the string
max = 0

until number.length == i - n

  j = i # j is the iterating count for when we're multiplying them
  total = 1

  n.times do
    total *= number[j].to_i
    j += 1
  end

  p max = total if total > max

  i += 1

end