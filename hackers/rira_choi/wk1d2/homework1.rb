def read_choice
	puts " "
	puts "Type (Basic) or (Advanced), "
	puts "Type (M)ortgage or (B)MI, "
	puts "Type (T)rip Caulator, "
	puts "Type (q)uit to exit please. "
	choice = gets.chomp

	if choice.capitalize == 'Basic' #check!
		basic_calc
		choice = gets.chomp.downcase

		if choice == 'a'
			print "(x)--Type numbers to add: "
				x = gets.chomp.to_i
			print "(y)--Type number to add: "
				y = gets.chomp.to_i
			puts "Your result is #{ x + y }! "

		elsif choice == 's'
			print "(x)--Type numbers to subtract: "
				x = gets.chomp.to_i
			print "(y)--Type number to subtract: "
				y = gets.chomp.to_i
			puts "Your result is #{ x - y }! "

		elsif choice == 'm'
			print "(x)--Type numbers to multiply: "
				x = gets.chomp.to_i
			print "(y)--Type number to multiply: "
				y = gets.chomp.to_i
			puts "Your result is #{ x * y }! "

		elsif choice == 'd'
			print "(x)--Type numbers to divide: "
				x = gets.chomp.to_f
			print "(y)--Type number to divide: "
				y = gets.chomp.to_f
			puts "Your result is #{ x / y }! "
		elsif
			choice == 'q'

		else
			print "Wrong! Type again please!"
		end

	elsif
		choice.capitalize == 'Advanced'
		advanced_calc
		choice = gets.chomp.downcase

		if choice == 'p'
			print 'Type a number: '
			x = gets.chomp.to_i
			print "Type a number of power: "
			y = gets.chomp.to_i
			print "Your result is #{ x ** y }!"
		elsif choice == 's'
			print "Type a number to get suare root: "
			x = gets.chomp.to_f.round(2)
			puts " Your result is #{Math.sqrt(x)}!"

		elsif
			choice == 'q'

		else
			puts " "
		end

	elsif
		if choice.capitalize == 'M'

			puts "Type your interest rate: "
			i = gets.chomp.to_f
			puts "Type your the number of payments: "
			n = gets.chomp.to_f
			puts "Type the principal of the loan: "
			p = gets.chomp.to_f

			#a = interest_rate(1 + i) ** number_of_payment
			#b = (1 + interest_rate) ** number_of_payment -1
			#c = a / b
			#mortgage = principal_of_the_loan * c

			m = p * i * (1 + i) ** n / ((1 + i) ** n - 1) #Check

			puts "your monthly payment will be $ #{ m } !"

		elsif choice.capitalize == 'B'
			puts "Type (K)ilograms and meters or (P)ounds and Inches: "
			x = gets.chomp

			if x.capitalize == 'K'
				puts "Type Weight in Kilograms: "
				w = gets.chomp.to_f
				puts "Type Height in Meters: "
				m = gets.chomp.to_f

				bmi = w / (m * m)

				puts "Ths result is #{bmi}!"

			elsif x.capitalize == 'P'
				puts "Type Wehight in Pounds: "
				w = gets.chomp.to_f
				puts "Type Height in Inches: "
				h = gets.chomp.to_f

				bmi = (w / (h * h)) * 703

				puts "The result is #{bmi} !"

			else
				puts " "
			end


		else
			puts " "

		end

	elsif
		choice.capitalize == 'T'

		puts "How far will you drive?: "
		d = gets.chomp.to_f # Distance
		puts "What is the fuel efficiency of the car: "
		mpg= gets.chomp.to_f # Miles per gallon
		puts "How much does gas cost per gallon?: "
		dpg = gets.chomp.to_f # Dallors per gallon
		puts "How fast will you drive?: "
		s = gets.chomp.to_f # Speed

		if s > 60
			o = s - 60 # over speed
			o = o * 2
			mpg = mpg - o
		end

		x_hours = d / s
		y_dollars = (d / mpg) * dpg


		puts "Your trip will take #{x_hours} hours and cost $#{y_dollars}."


  	else
  		"Error!"
  	end

	choice #check
end


def basic_calc
	print "(a)dd, (s)ubtract, (m)ultiply, (d)ivide: "
end

def advanced_calc
	print "(p)ower, (s)qrt: "
end



response = read_choice

	while response != 'q'
		  response = read_choice
	end

