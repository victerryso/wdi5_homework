# # calcumalator

def read_choice
	#basic_calc
	gets.chomp.downcase
end

def quit
	puts "Thank you, come again."
	Process.exit
end

q_st = "Type (q) to quit"

available_opt1 = ["ba", "ad", "q"]

# BASIC CALCULATION CHOICE
def basic_choice
	available_opt2_basic = ["a", "s", "m", "d"]

	response = read_choice

	if response == "q"
		quit
	end

	until available_opt2_basic.include? response
		puts "Please type in valid response."
		response = read_choice
	end

	case response
	when "a"
		puts "Enter first integer"
		x = gets.chomp.to_i
		puts "Enter second integer to add"
		y = gets.chomp.to_i
		puts "The answer is #{add(x,y)}."
	when "s"
		puts "Enter first integer"
		x = gets.chomp.to_i
		puts "Enter second integer to subtract"
		y = gets.chomp.to_i
		puts "The answer is #{subtract(x,y)}."
	when "m"
		puts "Enter first integer"
		x = gets.chomp.to_i
		puts "Enter second integer to multiply"
		y = gets.chomp.to_i
		puts "The answer is #{multiply(x,y)}."
	when "d"
		puts "Enter first integer"
		x = gets.chomp.to_i
		puts "Enter second integer to divide"
		y = gets.chomp.to_i
		puts "The answer is #{divide(x,y)}."
	else
		puts "Please enter a valid letter."
	end
end

# ADVANCED CALCULATION CHOICE
def advanced_choice
	available_opt2_advanced = ["p", "s"]

	response = read_choice

	if response == "q"
		quit
	end 

	until available_opt2_advanced.include? response
		puts "Please type in valid response."
		response = read_choice
	end

	case response
	when "p"
		puts "Enter base integer"
		x = gets.chomp.to_i
		puts "Enter exponent ingeter"
		y = gets.chomp.to_i
		puts "The answer is #{power(x,y)}."
	when "s"
		puts "Enter integer to root"
		x = gets.chomp.to_i
		puts "The answer is #{square(x)}."
	else
		puts "Please enter a valid letter."
	end
end

# BASIC CALCULATION MECHANISM

	def add(x,y)
	 	x + y
	end

	def subtract(x,y)	
		x - y
	end

	def multiply(x,y)
		x * y
	end

	def divide(x,y)
		x / y
	end
# ADVANCED CALCULATION MECHANISM

	def power(x,y)
		x ** y
	end

	def square(x)
		Math::sqrt(x)
	end

# END ALL CALCULATIONS

def basic_calc
	puts "(a)dd, (s)ubtract, (m)ultiply, (d)ivide: "
	basic_choice		
end

def advanced_calc
	puts "(p)ower, (s)qrt: "
	advanced_choice
end

# GETTING USER INPUT FOR CALCULATION

puts "What do you want to do? (ba)sic calc or (ad)vanced_calc"
response = read_choice

until available_opt1.include? response
	puts "Please type in valid response."
	response = read_choice
end

case response
	when "ba"
		basic_calc
	when "ad"
		advanced_calc
	when "q"
		quit
end

# while response != 'q'
#  	response = read_choice
# end

