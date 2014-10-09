
def basic_calc
	print "(a)dd, (s)ubtract, (m)ultiply, (d)ivide: "
	choice = gets.chomp.to_s
	case choice
		when 'a'
			p "(x)--Type the number to add: ";    x = gets.chomp.to_i
			p "(y)--Type the number to add: ";    y = gets.chomp.to_i
			puts "Your result is #{ x + y }! "

		when 's'
			p "(x)--Type the number to subtract: "; x = gets.chomp.to_i
			p "(y)--Type the number to subtract: "; y = gets.chomp.to_i
			puts "Your result is #{ x - y }! "

		when 'm'
			p "(x)--Type numbers to multiply: ";   x = gets.chomp.to_i
			p "(y)--Type number to multiply: ";    y = gets.chomp.to_i
			puts "Your result is #{ x * y }! "

		when 'd'
			p "(x)--Type numbers to divide: ";    x = gets.chomp.to_f
			p "(y)--Type number to divide: ";     y = gets.chomp.to_f
			puts "Your result is #{ (x / y).round(2) }! "

		else
			puts "Error!! "
		end
end

def advanced_calc
	print "(p)ower, (s)qrt: "
	choice = gets.chomp.downcase
		if choice == 'p'
			p "Type a number: ";           x = gets.chomp.to_i
			p "Type a number of power: ";  y = gets.chomp.to_i
			puts "Your result is #{ x ** y }!"
		elsif choice == 's'
			p "Type a number to get suare root: ";  x = gets.chomp.to_f
			puts " Your result is #{ Math.sqrt(x).round(2) }!"
		else
			puts "Error!! "
		end
end

def mortgage_calc
	p "Type your interest rate: ";          i = gets.chomp.to_f
	p "Type your the number of payments: "; n = gets.chomp.to_f
  p "Type the principal of the loan: ";   p = gets.chomp.to_f
	mortgate = p * i * (1 + i) ** n / ((1 + i) ** n - 1) #Check
	puts "your monthly payment will be $ #{ mortgate.round(2) } !"
end

def bmi_calc
	puts "Type (K)ilograms and meters or (P)ounds and Inches: "
		bmi_choice = gets.chomp.capitalize
		if bmi_choice == 'K'
			p "Type Weight in Kilograms: ";	w = gets.chomp.to_f
			p "Type Height in Meters: ";    m = gets.chomp.to_f
			bmi = w / (m * m)
			puts "Ths result is #{ bmi.round(3) }!"
		elsif bmi_choice == 'P'
			p "Type Wehight in Pounds: "
			w = gets.chomp.to_f
			p "Type Height in Inches: "
			h = gets.chomp.to_f
			bmi = (w / (h * h)) * 703
			puts "The result is #{ bmi.round(3) } !"
		else
				puts "Error!!!"
		end
end

def trip_calc
		p "How far will you drive?: "
		d = gets.chomp.to_f # Distance
		p "What is the fuel efficiency of the car: "
		mpg= gets.chomp.to_f # Miles per gallon
		p "How much does gas cost per gallon?: "
		dpg = gets.chomp.to_f # Dallors per gallon
		p "How fast will you drive?: "
		s = gets.chomp.to_f # Speed

		if s > 60
			o = s - 60 # over speed
			o = o * 2
			mpg = mpg - o
		end
		x_hours = d / s
		y_dollars = (d / mpg) * dpg
		puts "Your trip will take #{ x_hours.round(2) } hours and cost $#{ y_dollars.round(2) }."
end

def read_choice
p "---------------------- CACULATEOR ----------------------"
p "            Please Selcet Following Options             "
p "      1. Basic        2.Advanced     3. Mortgage        "
p "      4. BMI          5. Trip Caculator                 "
p "------------------- Press (q) to Exit ------------------"
main_choice = gets.chomp.to_s
case main_choice
	when "1" then basic_calc
	when "2" then advanced_calc
	when "3" then mortgage_calc
	when "4" then bmi_calc
	when "5" then trip_calc
	when "q" then puts "Thanks you, See you again! "
	else p "Please try again" end
end

response = read_choice
while response != 'q'
	 read_choice
end

