# Main menu method, displays options to for user selection
def main_menu
# Clears screen, displays main menu
  puts `clear`
	puts "=========================="
	puts "        qimbtmab          "
	puts "=========================="
	puts "Hello there ! qimbtmab can calculate !"
	puts "Press your letters to choose the type of calculator"
    puts "(b)asic"
    puts "(a)dvanced,"
    puts "(m)ortgage calculator,"
    puts "(t)rip calculator"
    puts "(bmi) calculator"
    print "(q)uit to exit : "
    gets.chomp.downcase
end
# =======================================================================================
# A basic mathemtical calculator to perform addition, subtraction, multiplication and 
# division operations based on 2 numbers
def basic_calc
# Clears screen and displays basic calculator menuu
	puts `clear`
	puts "====================="
	puts "Basic Math Calculator"
	puts "====================="
	print "Please press a letter to select the type of mathemtical operation to perform"
	print "for 2 numbers - (a)dd, (s)ubtract, (m)ultiply or (d)ivide: "
    operation = gets.chomp.downcase
    asmd = ['a','s','m','d']
    # Request user inputs
    if asmd.include? operation
        print "Please enter your first number:  "
        first = gets.chomp.to_f
        print "Please enter your second number:  "
        second = gets.chomp.to_f
        # Main calculation
        case operation
          when "a" then p first + second
          when "s" then p first - second
          when "m" then p first * second
          when "d" then p (first / second).round(2)
        end
        gets
    else
        puts "Please select something valid, the naga are everywhere."
        gets
    end
end
# =======================================================================================
# An advanced mathemtical calculator to perform power to and square root mathematical 
# operations based on 2 numbers
def advanced_calc
# Clears screen and display advanced calculator menu
  puts `clear`
	puts "========================"
	puts "Advanced Math Calculator"
	puts "========================"	
	print "Please press a letter to select the type of mathemtical operation to perform"
	print "for 2 numbers - (p)ower to or (s)quare root: "
  	operation = gets.chomp.downcase
  	ps = ['p', 's']
  # Request user inputs
	if ps.include? operation
      print "Please enter your first number: "
      first = gets.chomp.to_f
      if operation == "p"
      	print "Please enter your second number: "
      	second = gets.chomp.to_f
      	p first**second
      elsif operation == "s"
        p Math.sqrt(first)
      end
  else
      puts "Please select something valid and don't be a fail."
  end
  gets
end
# =======================================================================================
# Mortgage payment calculator based on calculation from www.wikihow.com/sample/mortgage-payment
#
# Calculates mortgage payments with : 
# princip = Loan Principal
# int_rate = Interest rate
# term_loan = term of loan in years
# num_of_pay = Number of payments
# int_num = (1+int)^num_of_pay
# numerator = i * int_num
# denomimator = int_num - 1
# mortgage_payment = princip * (numerator/denominator)
def mortgage_calc
# Clears screen, displays mortgage calculator menu
	puts `clear`
	puts "==================="
	puts "Mortgage Calculator"
	puts "==================="
	puts "Find out what your mortgage payment will be !"
  # Requesting inputs from user
 	puts "Please enter loan principal amount : "
 	princip = gets.chomp.to_f
 	puts "Please enter loan interest rate in % : "
 	int_rate = gets.chomp.to_f
	puts "How many long is the term of the loan (yrs): "
	term_loan = gets.chomp.to_f
  	# No. of payments calculation
  	num_of_pay = term_loan * 12
  	# Interest rate calculated component
  	int_rate = (int_rate/12)/100
  	int_num = (1 + int_rate)**num_of_pay
# Calculating the Numerator
 	numerator = int_rate * int_num
# Calculating the Denominator
 	denominator = int_num - 1
# Calculating the monthly Mortgage Payment
 	mortgage_payment = princip * (numerator/denominator)
 	mortgage_payment = mortgage_payment.to_f.round(2)
# Displays result - mortgage payment
 	puts "Your monthly mortgage payment is $ #{'%.02f' %mortgage_payment }"
 	gets
end
# =======================================================================================
# This is a trip calculator that calculates the distance to travel and how much it costs
# given that the user will provide distance to travel, miles per gallon efficiency, cost 
# per gallon of gas and the speed that will be travelled assuming all will remain 
# relatively constant
#
# dist = Distance to travel
# mpg = Fuel efficiency of the car
# cost_gallon  = Dollar cost per gallon
def trip_calc
# Clears screen and displays trip calculator
	puts `clear`
	puts "================"
	puts "Trip Calculator"
	puts "================"	
  puts `clear`
  puts "Find out how long your trip will take and how much it will cost you!"
# Request user inputs
  print "Please enter distance you will drive (miles): "
  dist = gets.chomp.to_f
  print "Please enter miles per gallon the car can get : "
  mpg = gets.chomp.to_f
  print "Please enter how much gas cost per gallon ($):  "
  cost_gallon = gets.chomp.to_f
  print "Please enter how fast you will drive (miles/hour): "
  speed = gets.chomp.to_f
# Main calculation
  if speed > 60
    over_limit = speed - 60
    mpg -= ( over_limit * 2 )
    puts "Because you will exceed the speed limit, the mpg is reduced to #{mpg}"
  else
    puts "Because you will keep to the speed limit, the mpg has not been reduced."
  end
  time = (dist / speed).round(1)
  cost = ( (dist / mpg) * cost_gallon ).round(2)
# Display result
  puts "Your trip will take #{time} hours and cost $#{cost}"
  gets
end
# =======================================================================================
# BMI calculator based on calculation from http://www.wikihow.com/Image:BMI.jpg
# # Calculates body mass index with : 
# wt = Weight in kilograms
# ht = height in metres
# bmi = wt / ht * ht
def bmi_calc
# Clears screen and displays bmi calculator
	puts `clear`
	puts "=============="
	puts "BMI Calculator"
	puts "=============="	
  puts `clear`
  puts "Find out what your BMI is !"
# Request user to select between pounds and kilos
  print "Please select to calculate your BMI in (p)ounds & inches or (k)gs & centimeters? "
  bmi_measure = gets.chomp
  pk_bmi = ['p','k']
# Error handling check
  if !(pk_bmi.include? bmi_measure)
    puts "You are not prepared ! Please enter a valid selection: "
    gets
    return
  end
# Request user inputs
  print "How heavy can you be?: "
  wt = gets.chomp.to_f
  print "And how short are you?: "
  ht = gets.chomp.to_f
# Main calculation
  if bmi_measure == 'p'
    bmi_result = (((wt)/(ht**2)) * 703)
  elsif bmi_measure == 'k'
    bmi_result = (wt/(ht**2))*10000
  end
# Result display
  puts "Your BMI is #{bmi_result.round(2)}."
  gets
end
# =======================================================================================
# Program executor, navigator
response = main_menu
while response != 'q'
  case response
    when 'b' then basic_calc
    when 'a' then advanced_calc
    when 'm' then mortgage_calc
    when 'bmi' then bmi_calc
    when 't' then trip_calc
    else
      puts "Please select something valid - is this all the fury you can muster?"
      gets
  end
  response = main_menu
end
# =======================================================================================
