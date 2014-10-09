# Say
# Write a program that will take a number from 0 to 99 and spell out that number in English.

# In other words, if the input to the program is 22, then the output should be 'twenty-two'

# e.g.

# Say.new(22).in_english
# Say.new(-1).in_english
# # say.rb:7:in 'in_english': Number must be between 0 and 99, inclusive. (ArgumentError)
# The program must also report any values that are out of range.

# Some good test cases for this program are:

# 0
# 14
# 50
# 98
# -1
# 100
# Extensions

# Shell out to Mac OS X's program to talk out loud.
class Say
  attr_accessor :number

  def initialize(number)
    @number = number
  end

  def in_english
      first = {"0" => "", "1" => "", "2" => "twenty", "3" => "thirty", "4" => "forty", "5" => "fifty", "6" => "sixty", "7" => "seventy", "8" => "eighty", "9" => "ninety"}
      second = {"0" => "", "1" => "one", "2" => "two", "3" => "three", "4" => "four", "5" => "five", "6" => "six", "7" => "seven", "8" => "eight", "9" => "nine"}
      tens = {"0" => "ten", "1" => "eleven", "2" => "twelve", "3" => "thirteen", "4" => "fourteen", "5" => "fifteen", "6" => "sixteen", "7" => "seventeen", "8" => "eighteen", "9" => "nineteen"}

    @number = @number.to_s.split("")
    if @number[1] == nil # number < 10
      @number[0] = second[@number[0]]
    elsif @number[0] == "1" # 10 < number < 20
      @number[0] = ""
      @number[1] = tens[@number[1]]
      @number.join
    else # number > 20
      @number[0] = first[@number[0]]
      @number[1] = second[@number[1]]
      @number.join
    end
  end
end

p Say.new(0).in_english
p Say.new(3).in_english
p Say.new(10).in_english
p Say.new(14).in_english
p Say.new(22).in_english
p Say.new(50).in_english
p Say.new(98).in_english