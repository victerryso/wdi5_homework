def greet
  print "Welcome, would you like to use (b)asic, (a)dvance, ,(m)ortgage repayment ,check your bm(i)  or (t)rips"
  greet = gets.chomp.downcase
end

def menu_one
  greeting = greet
  if greeting == 'b'
    puts "basic calc"
    basic_calc
  elsif greeting == 'a'
    puts "advance calc"
    advance_calc
  
  elsif greeting == 'm'
  	puts "mortgage repayment"
  	mortgage_repayment
  elsif greeting == "i"
  	puts "BMI"
  	bmi 

  elsif greeting == "t"
  	puts "Trip Calculator"
  	trip_calc
  		
    	
  elsif greeting == 'q'
    puts "Quitting"
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
    when  "p"
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

def mortgage_repayment
   print " Principal of the loan($) = "
   p = gets.chomp.to_f
   print " Interest rate(%) = "
   i = gets.chomp.to_f/100	
   print " Number of payments = "
   n = gets.chomp.to_i
   puts "Monthly payments = $#{ p * i * (1 + i) ** n / ((1 + i) ** n - 1)}".to_f.round(2)

end

def bmi
	# print " Weight in Kilograms ="
	# x = gets.chomp.to_f
	# print " Height in Meters ="
	# y = gets.chomp.to_f

	# puts "Your BMI is = #{x/(y * y)}"
	print "Height(m) = "
    x = gets.chomp.to_f
    print "Weight(kg) = "
    y = gets.chomp.to_f
    puts "BMI = #{y / x ** 2}."
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


while true
  menu_one
  
end


