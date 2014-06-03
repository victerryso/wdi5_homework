# # calcumalator

def read_choice
	#basic_calc
	gets.chomp.downcase
end

def quit
	puts "Thank you, come again."
	Process.exit
end

# BASIC CALCUMALATION CHOICE
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
		mainmenu
	when "s"
		puts "Enter first integer"
		x = gets.chomp.to_i
		puts "Enter second integer to subtract"
		y = gets.chomp.to_i
		puts "The answer is #{subtract(x,y)}."
		mainmenu
	when "m"
		puts "Enter first integer"
		x = gets.chomp.to_i
		puts "Enter second integer to multiply"
		y = gets.chomp.to_i
		puts "The answer is #{multiply(x,y)}."
		mainmenu
	when "d"
		puts "Enter first integer"
		x = gets.chomp.to_i
		puts "Enter second integer to divide"
		y = gets.chomp.to_i
		puts "The answer is #{divide(x,y)}."
		mainmenu
	else
		puts "Please enter a valid letter."
	end
end

# ADVANCED CALCUMALATION CHOICE
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
		mainmenu
	when "s"
		puts "Enter integer to root"
		x = gets.chomp.to_i
		puts "The answer is #{square(x)}."
		mainmenu
	else
		puts "Please enter a valid letter."
	end
end

# BASIC CALCUMALATION MECHANISM

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
# ADVANCED CALCUMALATION MECHANISM

	def power(x,y)
		x ** y
	end

	def square(x)
		Math::sqrt(x)
	end

def mortgage_calc
	# response = read_choice
	# if response == "q"
	#  	quit
	# end 
	puts "What is the principal of the loan? "
	print "$"
	p = gets.to_i
	puts "What is the annual interest rate? Input the percentage. "
	i = gets.to_f / 100 / 12.0 # to get monthly rate
	puts "How many payments are you making? "
	n = gets.to_i
	m = ( (i * ( ( 1 + i ) ** n ) ) / ( ( ( 1 + i ) ** n ) - 1 )) * p
	puts "Your monthly repayment is $#{m.round(2)}."
	puts "The interest paid is $#{ (( m * n ) - p).round(2) }"
	mainmenu
end

def bmi_calc
	puts "What is your weight in kgs?"
	w = gets.to_f
	puts "What is your height in cms?"
	h = gets.to_f / 100
	bmi = (w / (h ** 2))
	puts "Your height is #{h}cm, and you weight #{w}kgs!" , "Your BMI is #{bmi.round(1)}."
	
	if bmi < 18.5
		puts "You are underweight. Eat a sandwich."
	elsif bmi.between?(18.5, 24.9)
		puts "You are normal weight. How average."
	elsif bmi.between?(25, 29.9)
		puts "You are overweight. No icecream tonight!"
	else
		puts "You are obese. Might want to see a nutritionist about that."
	end
	mainmenu
end

def trip_calc
	puts "How for are you going in miles?"
	distance = gets.to_f
	puts "How fast are you going to go in Miles Per Hour?"
	speed = gets.to_i
	puts "What is the fuel efficiency of the car in Miles per Gallon?"
	mpg = gets.to_i
	puts "How much is the fuel per gallon in $0.00?"
	print "$"

	if speed > 60
		(61..speed).each {|x| mpg -= 2 } 
		# for every mile over 60, reduce mpg by 2
	end

	fuel_cost = gets.to_f
	trip_time = distance / speed
	trip_cost = distance / mpg * fuel_cost
	puts "Your trip will take #{trip_time.round(1)} hours and cost $#{trip_cost.round(2)}."
	puts mpg
	mainmenu
end

# END ALL CALCUMALATIONS

def basic_calc
	puts "(a)dd, (s)ubtract, (m)ultiply, (d)ivide: "
	basic_choice		
end

def advanced_calc
	puts "(p)ower, (s)qrt: "
	advanced_choice
end

# GETTING USER INPUT FOR CALCUMALATION
# response = mainmenu
def mainmenu
	available_opt1 = ["ba", "ad", "m", "bmi", "t", "q"]
	puts "-" * 20
	puts "Calcumalator"
	puts "-" * 20
	puts "Which calcumalator do you want to use?"
	puts "(ba)sic calcumalator", "(ad)vanced calcumalator" 
	puts "(m)ortgage calcumalator", "(bmi) calcumalator", "(t)rip calcumalator"
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
mainmenu

# while response != 'q'
#  	response = read_choice
# end

