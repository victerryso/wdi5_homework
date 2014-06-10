def options
	print "\nPlease choose from the following options:\n1 - Basic\n2 - Advanced\n3 - Mortgage\n4 - BMI\n5 - Trip\n6 - Quit\n\n> "
	gets.chomp.to_s.downcase
end

def basic_calc
	print "\nPlease choose from the following options:\n1 - Add\n2 - Subtract\n3 - Multiply\n4 - Divide\n5 - Back\n\n> "
	gets.chomp.to_s.downcase
end

def advance_calc
	print "\nPlease choose from the following options:\n1 - Power\n2 - Square Root\n3 - Back\n\n> "
	gets.chomp.to_s.downcase
end

def basic_options
	response = nil
	until response == "5" || response == "back"
		response = basic_calc
		addition if response == "1"
		subtraction if response == "2"
		multiplication if response == "3"
		division if response == "4"
	end
end

def advanced_options
	response = nil
	until response == "3" || response == "back"
		response = advance_calc
		power if response == "1"
		square_root if response == "2"
	end
end

def addition
	print "x = "
	x = gets.chomp.to_f
	print "y = "
	y = gets.chomp.to_f
	puts "#{x} + #{y} = #{x + y}"
end

def subtraction
	print "x = "
	x = gets.chomp.to_f
	print "y = "
	y = gets.chomp.to_f
	puts "#{x} - #{y} = #{x - y}"
end

def multiplication
	print "x = "
	x = gets.chomp.to_f
	print "y = "
	y = gets.chomp.to_f
	puts "#{x} * #{y} = #{x * y}"
end

def division
	print "x = "
	x = gets.chomp.to_f
	print "y = "
	y = gets.chomp.to_f
	puts "#{x} / #{y} = #{x / y}"
end

def power
	print "x = "
	x = gets.chomp.to_f
	print "y = "
	y = gets.chomp.to_f
	puts "#{x} ** #{y} = #{x ** y}"
end

def square_root
	print "x = "
	x = gets.chomp.to_f
	puts "sqrt(#{x}) = #{Math.sqrt(x)}"
end

def error
	puts "Error! Please choose a valid option."
end

def mortgage
	print "Principal of the loan($) = "
	x = gets.chomp.to_f
	print "Annual interest rate(%) = "
	y = gets.chomp.to_f / 100 / 12
	print "Number of payments = "
	z = gets.chomp.to_f
	puts "Monthly payment = $#{x * y * (1+y) ** z / ((1 + y) ** z - 1)}."
end

def bmi
	print "Height(m) = "
	x = gets.chomp.to_f
	print "Weight(kg) = "
	y = gets.chomp.to_f
	puts "BMI = #{y / x ** 2}."
end

def trip
	print "Distance(km) = "
	w = gets.chomp.to_f
	print "Fuel Efficiency(km/l) = "
	x = gets.chomp.to_f
	print "Cost Per Litre($/l) = "
	y = gets.chomp.to_f
	print "Speed(km/h) = "
	z = gets.chomp.to_f
	x -= (z - 60) * 2 if z > 60
	puts "\nYour trip will take #{w / z} hours and cost $#{w / x * y}."
end

option = nil

until option == "6" || option == "quit"
	option = options
	
	basic_options if option == "1" || option == "basic"
	advanced_options if option == "2" || option == "advance"
	mortgage if option == "3" || option == "mortgage"
	bmi if option == "4" || option == "bmi"
	trip if option == "5" || option == "trip"
end