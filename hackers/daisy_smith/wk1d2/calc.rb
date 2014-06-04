def choice
	puts "choose calculator"
	print "(b)asic, (a)dvanced (m)ore : "
	gets.chomp.downcase
end

def read_choice
	gets.chomp.downcase
end

def basic_calc
	print "(a)dd, (s)ubtract, (m)ultiply, (d)ivide: "
	response = read_choice
	if response == "a"
		puts "first number you want to add?"
		number1 = gets.chomp.to_i
		puts "second number you want to add?"
		number2 = gets.chomp.to_i
		total = addition(number1, number2)
	elsif response == "s"
		puts "first number?"
		number1 = gets.chomp.to_i
		puts "second number?"
		number2 = gets.chomp.to_i
		total = subtract(number1, number2)
	elsif response == "m"
		puts "first number"
		number1 = gets.chomp.to_i
		puts "second number?"
		number2 = gets.chomp.to_i
		total = multiply(number1, number2)
	elsif response == "d"
		puts "first number?"
		number1 = gets.chomp.to_i
		puts "second number?"
		number2 = gets.chomp.to_i
		total = divide(number1, number2)
	end

	puts total
	return choice
end

def addition(num1, num2)
	num1 + num2
end

def subtract(num1, num2)
	num1 - num2
end

def multiply(num1, num2)
	num1 * num2
end

def divide(num1, num2)
	num1 / num2
end

def adv_choice
	gets.chomp
end

def advanced_calc
	print "(p)ower, (s)qrt: "
	adv_response = adv_choice
	if	adv_response == "p"
		puts "first number?"
		number1 = gets.chomp.to_i
		puts "second number?"
		number2 = gets.chomp.to_i
		total = power(number1, number2)
	elsif adv_response == "s"
		puts "what should we find the square root of?"
		number1 = gets.chomp.to_i
		total = sqrt(number1)
	end

puts total

end


def power(num1, num2)
	num1 ** num2	
end

def sqrt(num1)
	Math.sqrt(num1)
end

def additional_choice
	gets.chomp
end

def additional_ft
	print "(m)ortgage, (b)mi, (t)trips"
	add_response = additional_choice
	if add_response == 'm'
		puts "What is the principal of the loan?"
		principal = gets.chomp.to_i
		puts "What is the interest rate?"
		interest = gets.chomp.to_i
		puts "What is the number of payments?"
		payments = gets.chomp.to_i
		total = monthly(principal, interest, payments)
			elsif add_response == 'b'
			puts "What is your weight?"
			weight = gets.chomp.to_i
			puts "What is your height?"
			height = gets.chomp.to_i
			total = bmi(weight, height)
		elsif add_response == 't'
			puts "How far will you drive?"
			distance = gets.chomp
			puts "What is the fuel efficiency of the car"
			mpg = gets.chomp
			puts "How much does gas cost per gallon?"
			pg = gets.chomp
			puts "How fast will you drive?"
			speed = gets.chomp
			total = trip_calc {"Your trip will take #{distance} and cost $#{pg}"}
	end

puts total

end

def monthly(principal, interest, payments)
	principal * interest *( 1 + interest ) * payments / ( 1 + interest ) * payments - 1
end

def bmi(weight, height)
	weight / height * height
end

def trip_calc(distance, mpg, pg,speed)
	distance / speed * mpg * pg
end

# main program
chosen = choice
if chosen == "a"
	advanced_calc
elsif chosen == "b"
	basic_calc
elsif chosen == "m"
	additional_ft
end

# return choice
# return chosen
chosen = choice
puts "im here"

while chosen != 'q'
	chosen = choice
end