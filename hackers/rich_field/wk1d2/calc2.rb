def mainmenu
	puts "would you like to use (a)dvanced, (b)asic, mort(g)age, (bmi), (t)rip or (e)xit"
	response = gets.chomp
end

def basic_calc
	puts "(a)dd, (s)ubtract, (m)ultiply, (d)ivide: "
end

def advanced_calc
	puts "(p)ower, sq(r)t: "
end

def mortgage_calc
	puts "mor(g)age calculator: "
end

def bmi_calc
	puts "(bmi) calculator: "
end

def trip_calc
	puts "(t)rip calculator: "
end

def exit
	puts "do you really want to (q)uit: "
end


#                                        $
#  *                               *    /_\
#       /\     *            ___.       /  ")
#   *  //\\    /\          ///\\      / /
#     ///\\\  //\\/\      ////\\\    / /     /\
#    ////\\\\///\\/\\.-~~-.///\\\\  / /     //\\
#   /////\\\\///\\/         `\\\\\\/ /     ///\\\
#  //////\\\\// /            `\\\\/ /     ////\\\\
# ///////\\\\\//               `~` /\    /////\\\\\
#////////\\\\\/      ,_____,   ,-~ \\\__//////\\\\\\
#////////\\\\/  /~|  |/////|  |\\\\\\\\//Party\\\\\\\
#//<           / /|__|/////|__|///////~|~Pete\\\\\\\\\
#
#~~~     ~~   ` ~   ..   ~  ~    .     ~` `   '.
#~ _  -  -~.    .'   .`  ~ .,    '.    ~~ .  '.


response = mainmenu
if response == 'a'
	advanced_calc
end
if response == 'b'
	basic_calc
end
if response == 'g'
	mortgage_calc
end
if response == 'bmi'
	bmi_calc
end
if response == 't'
	trip_calc
end
if response == 'e'
	exit
end

basic_calc = gets.chomp #crucial, no idea why.
case basic_calc
  when "a"
	  puts "Enter two numbers "
	  x = gets.chomp.to_i
	  y = gets.chomp.to_i
	  puts "=" + (x + y).to_s
	  mainmenu

  when "s"
	  puts "Enter two numbers "
	  x = gets.chomp.to_i
	  y = gets.chomp.to_i
	  puts "=" + (x - y).to_s
	  mainmenu

  when "m"
	  puts "Enter two numbers "
	  x = gets.chomp.to_i
	  y = gets.chomp.to_i
	  puts "=" + (x * y).to_s
	  mainmenu

  when "d"
	  puts "Enter two numbers "
	  x = gets.to_f
	  y = gets.to_f
	  puts "=" + (x / y).to_s
	  mainmenu

  when "p"	
	  puts "Enter two numbers "
	  x = gets.to_f
	  y = gets.to_f
	  puts "=" + (x ** y).to_s
	  mainmenu

  when "r"
	  puts "Enter number "
	  x = gets.to_f	
	  puts "=" + Math.sqrt(x).to_s
	  mainmenu

  when "g"
	  puts "Enter principle of loan "
	  p = gets.to_f # principle
	  puts "Enter annual interest rate "
	  i = gets.to_f / 100 / 12 # interest rate converted to monthly
	  puts "Enter number of payments"
	  n = gets.to_f # number of repayments
	  puts "=" + m = ( ( (i * ( ( 1 + i ) ** n ) ) / ( ( ( 1 + i ) ** n ) - 1 )) * p ).to_s	
	  mainmenu

  when "bmi"
	  puts "Enter weight in kg"
	  weight = gets.to_f
	  puts "Enter height in meters"
	  height = gets.to_f
	  bmi = ((weight) / ( (height) * (height) ) ).to_s
	  puts "Your BMI = #{ bmi }"
	  mainmenu

  when "t"
	  puts "Distance - How far will you drive? (Miles) "
	  distance = gets.to_f
	  puts "Miles Per Gallon - MPG "
	  mpg = gets.to_f
	  puts "$ Per Gallon "
	  $pg = gets.to_f
	  puts "Speed - How fast will you drive (MPH) "
	  speed = gets.to_f
       if speed > 60
		  for speed in (61..speed)
			  mpg -= 2
		end
		end
	  time = ( distance / speed )
	  cost = ( mpg * $pg)
	  puts "Your trip will take #{ time } and cost $#{ cost }. "
	  mainmenu
end