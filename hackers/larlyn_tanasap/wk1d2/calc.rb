# # calcumalator

def read_choice
	gets.chomp.downcase
end

def quit
	puts "Thank you, come again."
	Process.exit
end

def ask(msg)
	puts msg
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
		x = ask("Enter first integer")
		y = ask("Enter second integer to add")
		puts "#{x} + #{y} is #{( x + y )}."
		mainmenu
	when "s"
		x = ask("Enter first integer")
		y = ask("Enter second integer to subtract")
		puts "#{x} - #{y} is #{( x - y )}."
		mainmenu
	when "m"
		x = ask("Enter first integer")
		y = ask("Enter second integer to multiply")
		puts "#{x} times #{y} is #{( x * y )}."
		mainmenu
	when "d"
		x = ask("Enter first integer")
		y = ask("Enter second integer to divide")
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
		x = ask("Enter base integer")
		y = ask("Enter exponent ingeter")
		puts "#{x} to the power of #{y} is #{( x ** y )}."
		mainmenu
	when "s"
		x = ask("Enter integer to find the square root of")
		puts "The square root of #{x} is #{ Math::sqrt(x) }."
		mainmenu
	else
		puts "Please enter a valid letter."
	end
end

def mortgage_calc
	puts "What is the principal of the loan? "
	print "$"
	p = ask
	puts "What is the annual interest rate? Input the percentage. "
	i = ask / 100 / 12.0 # to get monthly rate
	puts "How many payments are you making? "
	n = ask
	m = ( ( i * ( ( 1 + i ) ** n ) ) / ( ( ( 1 + i ) ** n ) - 1 )) * p
	puts "Your monthly repayment is $#{ m.round(2) }."
	puts "The interest paid is $#{ (( m * n ) - p).round(2) }"
	mainmenu
end

def bmi_calc
	w = ask("What is your weight in kgs?")
	h = ask("What is your height in cms?") / 100
	bmi = (w / (h ** 2))
	puts "Your height is #{ h * 100 }cm, and you weight #{ w }kgs!" 
	puts "Your BMI is #{ bmi.round(1)}."
	
	if bmi.between?(0, 18.5)
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
	distance = ask("How for are you going in miles?")
	speed = ask("How fast are you going to go in Miles Per Hour?")
	mpg = ask("What is the fuel efficiency of the car in Miles per Gallon?")
	puts "How much is the fuel per gallon in $0.00?"
	print "$"
	fuel_cost = ask
	if speed > 60
		(61..speed).each { |x| mpg -= 2 } # for every mile over 60, reduce mpg by 2
		# mpg += ( speed - 60 ) * - 2 # without loop way
	end
	trip_time = distance / speed
	trip_cost = distance / mpg * fuel_cost
	puts "Your trip will take #{trip_time.round(1)} hours and cost $#{trip_cost.round(2)}."
	puts "Your Miles per gallon is #{mpg} when you are going at #{speed} miles per hour."
	mainmenu
end

def mainmenu
	available_opt1 = ["ba", "ad", "m", "bmi", "t", "q"] # makes a list of available options 
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

