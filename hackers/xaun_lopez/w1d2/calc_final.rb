def greet
  puts "Welcome, would you like to use (b)asic, (a)dvance, (m)ortgage, bm(i), or, (t)rip? "
  greet = gets.chomp.downcase
end

def menu_one
  greeting = greet
  if greeting == 'b'
    puts "Basic calculator.."
    basic_calc
  elsif greeting == 'a'
    puts "Advance calculator.."
    advance_calc
  elsif greeting == 'm'
    puts "Mortgage calculator.."
    mortgage_calc
  elsif greeting == 'i'
    puts "BMI calculator.."
    bmi
  elsif greeting == 't'
    puts "Trip calculator.."
    trip_calc
  elsif greeting == 'q'
    puts "Quitting.."
    Kernel.exit
  end
end


def basic_calc
  print "(a)dd, (s)ubtract, (m)ultiply, (d)ivide: "
  basic_response = gets.chomp
  case basic_response
  when "a"
    print ""
    x = gets.to_i
    print ""
    y = gets.to_i
    puts "= " + (x + y).to_s
  when "s"
    print ""
    x = gets.to_i
    print ""
    y = gets.to_i
    puts "= " + (x - y).to_s
  when "m"
    print ""
    x = gets.to_i
    print ""
    y = gets.to_i
    puts "= " + (x * y).to_s
  when "d"
    print ""
    x = gets.to_i
    print ""
    y = gets.to_i
    puts "= " + (x / y).to_s
  end
end

def advance_calc
  print "(p)ower, sq(r)t: "
  advance_response = gets.chomp
  case advance_response
    when "p"
      print ""
      x = gets.to_i
      print ""
      y = gets.to_i
      puts "= " + (x ** y).to_s
    when "r"
      print ""
      x = gets.to_f
      puts "= " + Math.sqrt(x).to_s
  end
end

def mortgage_calc
  print "Principal of the loan($) = "
  p = gets.chomp.to_f
  print "Interest rate(%) = "
  i = gets.chomp.to_f
  print "Number of payments = "
  n = gets.chomp.to_i
  print "Monthly payments = $#{ p * i * (1 + i) ** n / ((1 + i) ** n - 1)} ".to_s
end

def bmi
  print "Weight(kg) = "
  weight = gets.chomp.to_i
  print "Height(meters) = "
  height = gets.chomp.to_f
  puts "BMI = #{ weight / ((height) * (height)) }"
end

def trip_calc
  print "How far will you drive? "
  dist = gets.chomp.to_i
  print "What is the fuel efficiency of the car? "
  mpg = gets.chomp.to_i
  print "How much does gas cost per gallon? ($) "
  cpg = gets.chomp.to_f
  print "How fast will you drive? "
  speed = gets.chomp.to_i

  new_mpg = ((speed - 60) * 2 - mpg).abs
  cost = ((dist / new_mpg) * cpg).abs
  time = dist / speed.to_f
  puts "Your trip will take #{time} hours and cost $#{cost}."
end

menu_one


while true
  menu_one
end

