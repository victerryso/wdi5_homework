# # calcumalator

def read_choice
	gets.chomp.downcase
end

def quit
	puts "Thank you, come again."
	Process.exit
end

def input_to_f
	gets.to_f
end


# BASIC CALCUMALATION CHOICE
def basic_calc
	available_opt2_basic = ["a", "s", "m", "d"]
	puts "(a)dd, (s)ubtract, (m)ultiply, (d)ivide: "
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
		x = input_to_f
		puts "Enter second integer to add"
		y = input_to_f
		puts "#{x} + #{y} is #{( x + y )}."
		mainmenu
	when "s"
		puts "Enter first integer"
		x = input_to_f
		puts "Enter second integer to subtract"
		y = input_to_f
		puts "#{x} - #{y} is #{( x - y )}."
		mainmenu
	when "m"
		puts "Enter first integer"
		x = input_to_f
		puts "Enter second integer to multiply"
		y = input_to_f
		puts "#{x} times #{y} is #{( x * y )}."
		mainmenu
	when "d"
		puts "Enter first integer"
		x = input_to_f
		puts "Enter second integer to divide"
		y = input_to_f
		puts "#{x} divided by #{y} is #{( x / y )}."
		mainmenu
	else
		puts "Please enter a valid letter."
	end
end

# ADVANCED CALCUMALATION CHOICE
def advanced_calc
	available_opt2_advanced = ["p", "s"]
	puts "(p)ower, (s)qrt: "
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
		x = input_to_f
		puts "Enter exponent ingeter"
		y = input_to_f
		puts "#{x} to the power of #{y} is #{( x ** y )}."
		mainmenu
	when "s"
		puts "Enter integer to find the  root"
		x = input_to_f
		puts "The square root of #{x} is #{ Math::sqrt(x) }."
		mainmenu
	else
		puts "Please enter a valid letter."
	end
	puts
end

def mortgage_calc
	puts "What is the principal of the loan? "
	print "$"
	p = input_to_f
	puts "What is the annual interest rate? Input the percentage. "
	i = input_to_f / 100 / 12.0 # to get monthly rate
	puts "How many payments are you making? "
	n = input_to_f
	m = ( (i * ( ( 1 + i ) ** n ) ) / ( ( ( 1 + i ) ** n ) - 1 )) * p
	puts "Your monthly repayment is $#{m.round(2)}."
	puts "The interest paid is $#{ (( m * n ) - p).round(2) }"
	puts
	mainmenu
end

def bmi_calc
	puts "What is your weight in kgs?"
	w = input_to_f
	puts "What is your height in cms?"
	h = input_to_f / 100
	bmi = (w / (h ** 2))
	puts "Your height is #{h*100}cm, and you weight #{w}kgs!" , "Your BMI is #{bmi.round(1)}."
	
	if bmi < 18.5
		puts "You are underweight. Eat a sandwich."
	elsif bmi.between?(18.5, 24.9)
		puts "You are normal weight. How average."
	elsif bmi.between?(25, 29.9)
		puts "You are overweight. No icecream tonight!"
	else
		puts "You are obese. Might want to see a nutritionist about that."
	end
	puts
	mainmenu
end

def trip_calc
	puts "How for are you going in miles?"
	distance = input_to_f
	puts "How fast are you going to go in Miles Per Hour?"
	speed = input_to_f
	puts "What is the fuel efficiency of the car in Miles per Gallon?"
	mpg = input_to_f
	puts "How much is the fuel per gallon in $0.00?"
	print "$"

	if speed > 60
		(61..speed).each {|x| mpg -= 2 } 
		# for every mile over 60, reduce mpg by 2
	end

	fuel_cost = input_to_f
	trip_time = distance / speed
	trip_cost = distance / mpg * fuel_cost
	puts "Your trip will take #{trip_time.round(1)} hours and cost $#{trip_cost.round(2)}."
	puts "Your Miles per gallon is #{mpg} when you are going at #{speed} miles per hour." # tests if mpg is changed
	puts
	mainmenu
end

# GETTING USER INPUT FOR CALCUMALATION

def mainmenu
	available_opt1 = ["ba", "ad", "m", "bmi", "t", "q"] 
	# makes a list of available options 
	# puts `clear` # windows command for clear is cls. this is a shell command
	puts "-" * 20 , "Calcumalator", "-" * 20
	puts "\nWhich calcumalator do you want to use?"
	puts "\n\t(ba)sic calcumalator", "\t(ad)vanced calcumalator" 
	puts "\t(m)ortgage calcumalator", "\t(bmi) calcumalator", "\t(t)rip calcumalator"
	puts "\nType (q) to quit"
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

