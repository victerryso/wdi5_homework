def read_choice
  
  puts "Menu: Please chose from followings: 
  1 Basic calculation
  2 Advanced calculation
  3 Mortgage calculation
  4 BMI calculation 
  q quit"
  choice = gets.chomp
  if choice == '1' # choice is Basic calculation
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
      choice =='q'

    else
      print "Wrong! Type again please!"
    end # end of Basic calculation

  elsif #Choice is advanced calculation
    choice == '2' 
    advanced_calc
    choice = gets.chomp.downcase

    if choice == 'p'
      print 'Type a number: '
      x = gets.chomp.to_i
      print "Type a number of power: "
      y = gets.chomp.to_i
      puts "Your result is #{ x ** y }!"
    elsif choice == 's'
      print "Type a number to get suare root: "
      x = gets.chomp.to_f
      puts " Your result is #{Math.sqrt(x)}!"
    elsif choice == 'q'

    else
    puts "Error!!" 
    end  

  elsif choice == '3'
  	print "please enter your interest rate(%): "
    i_year = gets.chomp.to_f
    i = ((i_year /12) / 100).round(6) # change to decimal format per month rate 
    #puts i
    print "please enter your number of payments: "
    n = gets.chomp.to_i
    #puts n

    print "Please enter your principal of your loan: "
    p = gets.chomp.to_i

    x = i* ((1+i)**n)
    x.round(6)

    y = ((1+i)**n)-1
    y.round(4)

    z = x / y
    z.round(7)

    puts "Your mortgate monthly payment is: $#{(p * z).round(2)}"

  #elsif choice == 'q'

  #elsif
    #puts "Error!!" 
    #end  # end of Mortgage cal choice

  elsif choice == '4'
    print "Please chose inout method: 
    1 Weight in Pounds & Height in inches  
    2 Weight in Kilograms & Height in Meters "
    b_choice = gets.chomp

 	  if b_choice == '1'
 		 puts "Please enter your Weight in Pounds: "
 		 w = gets.chomp.to_f
      puts w

      print "please enter your height in inches: "
      h = gets.chomp.to_f
      puts h

      x = h * h 
      bmi = (w / x) * 703
      puts "Your BMI is: #{bmi.round(2)}"

    elsif b_choice == '2'
      print " Please enter your weight in Kilograms: "
      k = gets.chomp.to_f
      print "Please enter your height in Meters: "
      m = gets.chomp.to_f
      bmi = k/(m * m)
      puts "Your BMI is: #{bmi.round(2)} "

    elsif choice == 'q'
      #puts "Thank you!"
    else
      puts "Error!!" 
    end  # end of BMI cal choice
  #elsif choice == 'q'

    #else
     # puts "Error!!" 
  end  # end of main if 

  return choice #check  
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

	


 