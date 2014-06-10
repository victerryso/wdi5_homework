### FREQUENTLY USED METHODS
def read_choice
	gets.chomp.downcase
end

def repeat
	puts ""
	puts "Would you like to do anything else?"
	mainmenu
end

def input_to_f
	gets.to_f.round(2)
end

def input_to_i
	gets.to_i
end

def quit
	puts "Thank you, come again."
	Process.exit
end

### CALCULATIONS CHOICE AND MECHANISM
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
			puts "ADD: Enter first integer"
			num1 = input_to_i
			puts "Enter second integer"
			num2 = input_to_i
			puts "ANSWER: #{num1} + #{num2} = #{add(num1,num2)}."
			repeat
		when "s"
			puts "SUBTRACT: Enter first integer"
			num1 = input_to_i
			puts "Enter second integer"
			num2 = input_to_i
			puts "ANSWER: #{num1} - #{num2} = #{subtract(num1,num2)}."
			repeat
		when "m"
			puts "MULTIPLY: Enter first integer"
			num1 = input_to_i
			puts "Enter second integer to multiplnum2"
			num2 = input_to_i
			puts "ANSWER: #{num1} * #{num2} = #{multiplnum2(num1,num2)}."
			repeat
		when "d"
			puts "DIVIDE: Enter first integer"
			num1 = input_to_i
			puts "Enter second integer to divide"
			num2 = input_to_i
			puts "ANSWER: #{num1} / #{num2} = #{divide(num1,num2)}."
			repeat
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
		puts "POWER: Enter base integer"
		x = input_to_i
		puts "Enter exponent ingeter"
		y = input_to_i
		puts "ANSWER: #{x} to the power of #{y} is #{power(x,y)}."
		repeat
	when "s"
		puts "SQUARE ROOT: Enter integer to root"
		x = input_to_i
		puts "ANSWER: The square root of #{x} is #{square(x)}."
		repeat
	else
		puts "Please enter a valid letter."
	end
end

# MORTGAGE CALCULATION CHOICE
def mortgage_calc
	puts "MORTGAGE CALCULATION: What is the principal of the loan?"
	print "$"
	p = gets.to_i # what if the user puts in currency? How to level this?
	puts "What is the annual interest rate? (%)"
	i = gets.to_f / 100 / 12.0 # i*100 to convert percentage to float, then *12 to get monthly rate
	puts "How many payments are you making?"
	n = gets.to_i

	mortgage = p * ( (i * ( ( 1 + i ) ** n ) ) / ( ( ( 1 + i ) ** n ) - 1 )) 
	puts "Your monthly repayment is $#{mortgage.round(2)}."

	repeat
end

# BMI CALCULATION CHOICE

def bmi_calc
	puts "How much do you weight (in kilograms)?"
	weight_kg = gets.to_f
	puts "How tall are you (in centimeters)?"
	height_cm = gets.to_f
	height_m = height_cm / 100

	bmi = '%.2f' % ( weight_kg / ( height_m * height_m ) )
	puts "Calculating MBI:"
	puts "#{weight_kg} kg / ( #{height_m} m * #{height_m} m )"
	puts "Your BMI is #{bmi}."

	repeat
end

# TRIP CALCULATION CHOICE

def trip_calc
	puts "How far will you drive (in miles)?"
	distance = input_to_f
	puts "What is the fuel efficiency of your car? (MPG)"
	mpg = input_to_f
	puts "How much does gas cost per gallon?"
	print "$"
	cpg = input_to_f
	puts "How fast will you be driving? (miles per hour)"
	mph = input_to_f

	#TRIP CALC MECHANISM
	if mph > 60.00
		puts "Look at you, you speed demon!"
		mpg_adj = ( mpg - (( mph - 60 ) * 2 )).to_f.round(2)
	else 
		puts "Slowpoke..."
		mpg_adj = mpg
	end

	trip_time_hrs = distance / mph
	trip_cost = ( distance / mpg_adj ) * cpg

	puts "ANSWER: Your trip will take #{trip_time_hrs.round(2)} hrs and cost $#{trip_cost.round(2)}"

	repeat
end

# BASIC CALCULATIONS MECHANISM
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

# ADVANCED CALCULATIONS MECHANISM
	def power(x,y)
		x ** y
	end

	def square(x)
		Math::sqrt(x)
	end

### END ALL CALCULATIONS

### Menus
# >> SECOND-LEVEL MENUS
def basic_calc
	puts "BASIC CALCULATIONS: Please select an action:"
	puts " - (a)dd" 
	puts " - (s)ubtract" 
	puts " - (m)ultiply" 
	puts " - (d)ivide"
	basic_choice		
end

def advanced_calc
	puts "ADVANCED CALCULATIONS: Please select an action:"
	puts " - (p)ower"
	puts " - (s)qrt"
	advanced_choice
end

# >> FIRST-LEVEL MENU
def mainmenu
	available_opt1 = ["ba", "ad", "m", "bmi", "t", "q"]

	puts " - (ba)sic calculator"
	puts " - (ad)vanced calculator"
	puts " - (m)ortgage calculator"
	puts " - (bmi) calculator"
	puts " - (t)rip calculator"
	puts "Type (q) to quit"
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
		when "m"
			mortgage_calc
		when "bmi"
			bmi_calc
		when "t"
			trip_calc	
		when "q"
			quit
	end
end


# PROGRAM EXECUTION STARTS HERE! #

while true
	puts "What would you like to do?"
	mainmenu
end
