# https://gist.github.com/epoch/c4dbb929688cac02099d

# Say Magnitudes
# Write a program that will take a number from 0 to 999,999,999,999 and break it into chunks, adding the magnitude.

# In other words, if the input to the program is 1234567890 then the output should be '1 billion 234 million 567 thousand 890'

# The program must also report any values that are out of range.

# Extensions

# If you solved the chunking using math, solve it again using strings.

# If you solved it using strings, solve it using math.

# If you solved it using strings by reversing it, solve it again by padding the string. And the inverse.

# Refactor!


# Via Maths
# p number = 1234567890
# if number > 0 && number < 1000000000000
#   p units = number.divmod(1000)
#   p thousands = units[0].divmod(1000)
#   p millions = thousands[0].divmod(1000)
#   p billions = millions[0].divmod(1000)
#   p whole_word = "#{billions[1]} billion #{millions[1]} million #{thousands[1]} thousand #{units[1]}"
# end


# Via Strings
p number = 1234567890
  p array = number.to_s.split('')
  count = 0
  whole_word = ''
  suffix = ['', ' thousand ', ' million ', ' billion ', ' trillion ']

  until array.empty?
    units = array.pop
    tens = array.pop
    hundreds = array.pop

    tens = '' if tens == nil
    hundreds = '' if hundreds == nil

    p word = hundreds + tens + units + suffix[count]
    p whole_word = word + whole_word
    count += 1
  end