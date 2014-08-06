p number = 1999
conversion = [[1000, 'M'], [900, 'CM'], [500, 'D'], [400, 'CD'], [100, 'C'], [90, 'XC'], [50, 'L'], [40, 'XL'], [10, 'X'], [9, 'IX'], [5, 'V'], [4, 'IV'], [1, 'I']]
roman = ''

conversion.each do |x|
  while number >= x[0]
    roman += x[1]
    number -= x[0]
  end
end

p roman