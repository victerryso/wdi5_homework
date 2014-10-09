# https://gist.github.com/epoch/cc0e13e51459fefa0d96

# Binary
# Write a program that will convert a binary number, represented as a string (i.e. "101010"), to it's decimal equivalent using first principles (i.e. no, you may not use built-in ruby libraries or gems to accomplish the conversion).

# The program should consider strings specifying an invalid binary as the value 0.

# This is how computers work:

# # "1011001"
#   1     0     1     1     0     0     1
# 2^6 + 2^5 + 2^4 + 2^3 + 2^2 + 2^1 + 2^0
#  64 +   0 +  16 +   8 +   0 +   0 +   1 = 89
# If you want to write extra tests and/or check your answers, feel free to use irb:

# irb(main):001:0> 0b1011001
# => 89
# irb(main):002:0> 0b1101
# => 13
# irb(main):003:0> 0b110110110110101
# => 28085
# Tests are provided, delete one skip at a time.

binary = '110110110110101'
index = 0; sum = 0

binary.reverse.chars.each do |x|
  sum += x.to_i * 2 ** index
  index += 1
end

p sum