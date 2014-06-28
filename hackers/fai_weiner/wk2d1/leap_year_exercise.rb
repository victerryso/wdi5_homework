class Year
  attr_accessor :year
  def initialize(year)
    @year = year
  end
  def leap? 
    if @year % 4 == 0 # if year is divisible by 4 then it MIGHT be a leap year
      if @year % 100 == 0 # but if year is divisible by 100...
        return false # ... then common year
      else
        if @year % 400 == 0 # if year is divisible by 100 (might be a common year)
          # but is also divisible by 400
          return false
        else
          return true
        end
      end
    else
      return false # if not divisible by 4, then it's a common year
    end
  end
  def leap_method_2?
    if @year % 4 == 0 && @year % 100 != && @year % 400 != 0
  end
  def leap_method_3?
    return false if @year % 4 != 0
    return false if @year % 100 != 0
    return false if @year % 400 != 0
    true
  end

end

puts Year.new(1996).leap?

puts Year.new(1997).leap?

puts Year.new(1990).leap?

puts Year.new(2000).leap?

# if year is not divisible by 4 then common year
# else if year is not divisible by 100 then leap year
# else if year is not divisible by 400 then common year
# else leap year