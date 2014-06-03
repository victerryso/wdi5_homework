# First, ask the user if they want basic or advanced options.
def start
	puts
	puts "Welcome to my crappy calc."
	puts "You can choose the (b)asic or (a)dvanced calc, (mo)rtgage calc, (bmi) calc or (trip) calc"
	response = gets.chomp.downcase
	case response
	when 'b'
		basic_calc
	when 'a'
		advanced_calc
	when 'mo'
		mortgage
	when 'bmi'
		bmi
	when 'trip'
		trip
	when 'q'
		quit
	else
		"Unknown restarting..."
		start
	end
end

# Get choice of operator for basic and advanced
def basic_calc
	print "(a)dd, (s)ubtract, (m)ultiple, (d)ivide: "
	response = gets.chomp.downcase
	case response
	when 'a'
		a, b = numbers
		add(a, b)
	when 's'
		a, b = numbers
		subt(a, b)
	when 'm'
		a, b = numbers
		multi(a, b)
	when 'd'
		a, b = numbers
		div(a, b)
	when 'q'
		quit
	else
		puts "Unknown, restarting..."
		basic_calc
 	end
 end


def advanced_calc
	print "(p)ower, (s)qrt: "
	response = gets.chomp.downcase
	case response
	when 'p'
		a, b = numbers
		power(a, b)
	when 's'
		print "Enter number: "
		n = gets.to_f
		puts (n ** 0.5)
	when 'q'
		quit
	else
		puts "Unknown, restarting..."
		advanced_calc
	end
end

# User to enter numbers
def numbers()
	print "Enter your first number: "
	n1 = gets.to_f
	print "Enter your second number: "
	n2 = gets.to_f
	[n1, n2]
end

# Do some maths:

def add(x, y)
	puts x + y
	start
end

def subt(x, y)
	puts x + y
	start
end

def multi(x, y)
	puts x + y
	start
end

def div(x, y)
	puts x + y
	start
end

def power(x, y)
	puts x ** y
	start
end

def sqrt(x)
	puts (x ** 0.5)
	start
end

###################################################
# HOMEWORK
###################################################

# MORTAGE CALC
#monthly payment 		- monthly_payment
#prinicpal of the loan 	- prin_loan
#interest rate 			- inter_rate
#number of payments 	- payments

def mortgage
	print "Enter the principal of the loan: "
	prin_loan = gets.to_f
	print "Enter the interest rate: "
	inter_rate = gets.to_f
	print "Enter the number of payments: "
	payments = gets.to_f	
 
	monthly_payment =  prin_loan * ((inter_rate * ((1 + inter_rate)) ** payments)) / (((1 + inter_rate) ** payments) -1)
	puts "Your monthly repayment is: $#{monthly_payment}."
	
	start
end

# BMI CALC
def bmi
	puts "Note, this calc uses lbs and inches."
	print "Please enter your weight: "
	weight = gets.to_f
	print "Please enter your height: "
	height = gets.to_f

	bmi_result = weight / (height * height) * 703
	puts "Your BMI index is #{ bmi_result }." 

	start
end

#TRIP CALC
#Distance - distance
#MPG - mpg
#$PG - cost_per_g
# Speed - speed

def trip
	print "How far will you be driving? "
	distance = gets.to_f
	print "What is the fuel efficiency of the car? "
	mpg = gets.to_f
	print "How much does gas cost per gallon? "
	cost_per_g = gets.to_f
	print "How fast will you drive? "
	speed = gets.to_f

if speed > 60
	(61..speed).each do |x| 
		mpg -= 2
	end
end
	trip_time = distance / speed
	fuel_used = distance / mpg
	total_cost = fuel_used * cost_per_g 

	puts "Your trip will take you #{ trip_time } hours and cost $#{ total_cost }."
		
start
end



def quit
Kernel.exit(false)
end

start
