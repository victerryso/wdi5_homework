

print "How far will you drive? (mile): "
#k = gets.chomp.to_f
#m = k / 1.61  # get mile 
#puts "#{k}km, #{m}mile"
m = gets.chomp.to_f
puts "#{m} mile. "



print "What is the fuel efficiency of the car? (MPG): "
mpg = gets.chomp.to_f

print "How much does gas cost per gallon? "
pg = gets.chomp.to_f

print "How fast will you dirve? "
mph = gets.chomp.to_i

# 3.5 hrs cost $255.33
#3.5 hrs = distance / speed 
# distance = m
# speed = mph 
#--------------------
#cost $255.33 = (distance * mpg) * $pg  
#now we need to check real mpg per current mph
#real mpg(r_mpg) = mpg -  ((current mph - 60)*2)

if mpg > 0 && mpg < 30 # 0 < mpg < 30  
  then if  mph >60 &&  mph < 75  # 60 < mph < 75 
    #check current speed
    x = mph - 60  # eg x = 61 - 60 
    puts "your mph - 60 = #{x}" 
    #each x mpg - 2 
    r_mpg = mpg - (x*2)
    puts "your real mpg is #{r_mpg}MPG"

  elsif (mph > 0 && mph < 60) || (mph == 60)
    #np change the real mpg 
    r_mpg = 30 
    puts "Your real mpg is same as your MPG #{r_mpg}MPG"

   else 
    puts "Error. Please enter " 
  end
  #return r_mpg 
end 

#trip time is Distance / speed 
 t_time = m / mph 
 puts " time is #{(t_time).to_f.round(2)}"

 # trip cost = (m * t_mpg) * pg
 trip_cost = (m * r_mpg) * pg 
 puts " trip cost is $#{trip_cost}"


    # if mph = 60  
    # then mpg = 30 



# elsif 
# else
# end




#puts "Your BMI is: #{bmi.round(2)}"






#puts x.to_f
#puts y.to_f

#puts "Your mortgate monthly payment is: #{p*(x/y)}"



# y.to_f = ((1 + i)**n ) - 1
# puts "#{bottom}"

# mortgage.to_f = p * (up/bottom)
# puts "your mortgage is : #{mortgage}"








# end

# def basic_calc
#   print "(a)dd, (s)ubtract, (m)ultiply, (d)ivide: "
# end

#def advanced_calc
  # print "(p)ower, (s)qrt: "
  # ad_choice = gets.chomp.downcase # chose functuin 
  # Print "please enter 2 number for calcuration x, y" #enter 2 numbers in array
  # choice = gets.chomp.to_i[x,y]
  # print "result is #{x**y}"
  
  # if ad_choice =='p'
  #   print 'your result is #{x**y}'
  # end


  # if ad_choice == "p"
  # 	print "You chose Power. Please enter the x -1st number: "

  # 	print "you entered: #{x}"
  # 	print "Please enter the 2nd number: "

#end



#response = read_choice
#def choice 
# print "Chose: (b)asic or (a)dvanced or (q)quit: "
# choice = gets.chomp.downcase
# if choice == "b"
# 	print "please chose from:"
#   basic_calc
# elsif
# 	choice =="a"
  
#   print "Please chose from: "
#   advanced_calc
# else
# 	print "you chose to quite"
# end 
#end

  #gets.chomp.downcase
