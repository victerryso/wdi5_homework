p number = 378
conversion = [100, 50, 20, 10, 5]

conversion.each do |x|
  sum = 0
    while number >= x
      number -= x
      sum += 1
    end
    p "#{sum} $#{x}" if sum > 0
end