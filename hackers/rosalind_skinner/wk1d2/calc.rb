def user_input
		n1 = input_return("What is your first number?")
		n2 = input_return("What is your second number?")	
		return [n1, n2]
end

# Makes sure user input is a number
def input_return(message)
	number = nil
	while number == nil
		print message
		begin
			number = Float(gets.chomp)
		rescue
			puts "You screwed up! Put a number"
		end
	 end
	number
 end

# Start of caculator options 
def start
	print "What would you like to do: (c)alculate, (m)ortgage, (b)mi, (t)rip? "
	response = gets.chomp
	case response
		when 'c'
			calc
		when 'm'
			mortgage
		when 'b'
			bmi
		when 't'
			trip
		when 'q'
			Kernel.exit
		else
			puts "Not valid"
		 end
	 end

#mortgage calculator
def mortgage
	p = input_return("What is the Principal of the loan? ")
	i = input_return("What is the interest rate? ")
	
	
	if (i > 1) || (i < 0)
		puts "Not valid "
		i = input_return("What is the interest rate? ")
	 end
		n = input_return("What are the number of payments? ")
		m = p*((i*(1 + i) ** n)/(((1 + i) ** n) -1))
		m = m.round(2)
		puts "Your monthly payments on your mortgage are $#{m}. "
	start
	
 end

def bmi
	w = input_return("What is your weight in kg? ")
	h = input_return("What is your height in meters? ")
	
	if h > 2.5
		puts "Not valid"
		bmi
	else
		b = w / (h * h)
		b = b.round(2)
		puts "Your BMI is #{b} "
		start
	 end
	
 end

def trip
	puts "Calculate the cost and time it takes to drive to your destination: "
	dist = input_return("How far will you drive (km)? ")
	eff = input_return("What is the fuel efficiency of the car (km/L)? ")
	cost = input_return("How much does gas cost per litre(price/L)? ")
	speed = input_return("How fast will you drive (km/h)? ")

	# if the speed is greater than 60km then efficiency is 2 less than input value
	if speed > 60
		eff -= 2
	end

	time = dist/speed
	money = (dist/ eff) * cost

	time = time.round(2)
	money = money.round(2)
	puts "Your trip will take #{time} hours and cost $#{money}. "
	start

 end

def calc
	print "Would you like to do a (b)asic or (a)dvanced calculation? "
	response = gets.chomp
	case response
		when 'b'
			basic_calc
		when 'a'
			advanced_calc
		when 'q'
			start
		else 
			puts "Not valid"
	 end
end

def basic_calc
	running = true
	while running
	print "(a)dd, (s)ubtract, (m)ultiply, (d)ivide: "	
		response = gets.chomp.downcase

		case response
			when 'a'
				answer = add(user_input)
				puts "The answer is #{answer} "
			when 's'
				answer = subtract(user_input)
				puts "The answer is #{answer} "
			when 'm'
				answer = multiply(user_input)
				puts "The answer is #{answer} "
			when 'd'
				answer = divide(user_input)
				puts "The answer is #{answer} "
			when 'c'
				advanced_calc
			when 'q'
				running = false
			else 
			puts "Not valid"	
		 end

	 end
	calc
 end

def advanced_calc

	running = true
	while running
		print "(p)ower, (s)qrt: "
		response = gets.chomp.downcase
		case response
		when 'p'
			puts "The answer is #{power(user_input)} "
		when 's'
			print "What is the number? "
			puts "The square root is #{sqrt(gets.to_i)} "
		when 'q'
			running = false
		else 
			puts "Not valid"
		end
	end
	calc
end


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

start
