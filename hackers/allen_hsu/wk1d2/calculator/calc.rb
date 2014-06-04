=begin
TODO LIST
	-round floats
	-prime working

Dodgy choices
	- can't quit while running calcs
	- loop dos
=end
#import
$LOAD_PATH << '.'

require 'moduleprime'

#helpers
def quit_message
	puts
	puts "q to quit"
end

def user_input
		n1 = input_return("What is your first number?")
		n2 = input_return("What is your second number?")	
		return [n1, n2]
end

def another_round
	print "y for another?"
	input = gets.chomp.downcase
	if input == 'y' 
		true
	else
		false
	end
end

#sanitise input
#doing a try catch for what seems to be an easy thing, wonder if there is an easier way
def input_return(message)
	number = nil
	while number == nil
		print message
		begin
			input = gets.chomp.downcase
			unless input == 'q'
				number = Float(gets.chomp)
			end
		rescue
			#(\/) (°,,,°) (\/)
			puts "Your inputs' bad and you should feel bad! Put a number"
		end
	end
	number
end

#base menu
def start
	loop do
		quit_message
		print "Would you like to do a (b)asic, (a)dvanced calculation?, (m)ortgage, bm(i), (p)rime or (t)rip?"
		response = gets.chomp

		case response
			when 'b'
				basic_calc
			when 'a'
				advanced_calc
			when 'm'
				mortgage_calc
			when 'i'
				bmi_calc
			when 't'
				trip_calc
			when 'p'
				prime_calc
			when 'q'
				puts 'Seeya!'
			else 
				puts "Not valid"
		end
		break if response == 'q'
	end
end

#calculators
def basic_calc
	loop do
		quit_message
		print "(a)dd, (s)ubtract, (m)ultiply, (d)ivide: "	
		response = gets.chomp.downcase

		case response
			when 'a'
				answer = add(user_input)
				puts "The answer is #{answer}"
			when 's'
				answer = subtract(user_input)
				puts "The answer is #{answer}"
			when 'm'
				answer = multiply(user_input)
				puts "The answer is #{answer}"
			when 'd'
				answer = divide(user_input)
				puts "The answer is #{answer}"
			when 'c'
				advanced_calc
			when 'q'
			else 
			puts "Not valid"	
		end

		break if response == 'q'
	end
end

def advanced_calc
	loop do
		print "(p)ower, (s)qrt: "
		response = gets.chomp.downcase
		case response
			when 'p'
				puts "The answer is #{power(user_input)}"
			when 's'
				print "What is the number?"
				puts "The square root is #{sqrt(gets.to_i)}"
			when 'q'
			else 
				puts "Not valid"
		end

		break if response == 'q'
	end
end

def mortgage_calc
	running = true
	while running
		#trying to do by hash and array to get 'q'
		# inputs_array = [ p, i, n]
		# inputs = {
		# 	"What is the principal?" : 0,
		# 	"What is the interest as a %?" : 0,
		# 	"What is the period?" : 0
		# }
		# for key in inputs.keys
		# 	unless inputs == 'q'
		# 		inputs[key]=input_return(key)
		# 	else
		# 		running = false
		# 		break
		# end

		p = input_return("What is the principal?")
		i = input_return("What is the interest as a %?")/100/12
		n = input_return("What is the period?")
		m = p*((i*(1+i)**n)/((1+i)**n-1))
		puts "The monthly repayment is #{m.round(2)}"
		running = another_round
	end
end

def bmi_calc
	running = true
	while running
		h = input_return("What is your height in metres?")
		w = input_return("What is your weight in kilograms?")
		puts "Your BMI is #{(w/(h**2)).round(2)}"
		running = another_round
	end
end

def trip_calc
	running = true
	while running
		d = input_return("How far will you drive(miles)?")
		mpg = input_return("What is the fuel efficiency of the car?")
		gallon_price = input_return("What is the price of fuel per gallon?")
		speed = input_return("How fast will you drive?")
		if speed > 60
			over60 = speed -60
			mpg = mpg-over60*2
		end
		puts "Your trip will take #{(d/speed).round(2)} hours and cost $#{(d/mpg).round(2)}"
		running = another_round
	end
end

def prime_calc
	running = true
	while running
		number = input_return("What number do you think is prime?")
		puts ModulePrime.is_prime?(number)
		running = another_round
	end
end

#math functions
def add(array)
	array[0] + array[1]
end

def subtract(array)
	array[0] - array[1]
end

def multiply(array)
	array[0] * array[1]
end

def divide(array)
	array[0] / array[1]
end

def power(array)
	array[0] ** array[1]
end

def sqrt(n)
	n ** 0.5
end


# start program
start