
  
require 'pry'
require 'pry-debugger'
lines = {
  :N =>["Times Square", "34th", "28th", "23rd", "Union Square", "8th" ],
  :L =>["8th", "6th", "Union Square", "3rd", "1st"],
  :"6" => ["Grand Central" , "33rd", "28th", "23rd", "Union Square", "Astor Place"]
}

user = 'yes'

while user == 'yes'
puts "What line would you like to take (N, L or 6)?"
start_user_line = gets.chomp.upcase.to_sym
p lines[start_user_line].join(', ')
puts "What is your first stop? "
user_start = gets.chomp
puts "What line is your destination on (N, L or 6)?"
end_user_line = gets.chomp.upcase.to_sym
p lines[end_user_line].join(', ')
puts "What is your end destination? "
user_end = gets.chomp.to_s
  
 intersection1 = lines[start_user_line].index 'Union Square'
 intersection2 = lines[end_user_line].index 'Union Square'

start_station = lines[start_user_line].index user_start
end_station = lines[end_user_line].index user_end



if start_user_line == end_user_line
  if start_station < end_station
    trip = lines[start_user_line][start_station..end_station]
  else
    trip = lines[start_user_line][end_station..start_station]
  end
  puts "The number of stops in your trip is #{ trip.length } "
  puts "The stops are : #{trip.join(', ')}"
else
  if start_station < intersection1
    trip = lines[start_user_line][start_station..intersection1]
  end
  if end_station < intersection2
    trip2 = lines[end_user_line][end_station...intersection2]
    trip2.reverse!
  end
  if start_station > intersection1
    trip = lines[start_user_line][intersection1..start_station]
    trip.reverse!
  end
  if end_station > intersection2
    trip2 = lines[end_user_line][intersection2...end_station]
  end
  puts "Your stops: #{trip.join(', ')}, #{trip2.join(', ')}"
  puts "The number of stops in your trip is #{ trip.length + trip2.length } "
end

puts "would you like to plan another trip (Yes/No)? "
  user = gets.chomp.downcase

  if user != 'yes'
    Kernel.exit
  end
end




#  require 'pry'
#  require 'pry-debugger'


# lines = {
#    :n =>["Times Square", "34th", "28th", "23rd", "Union Square", "8th" ],
#    :l => ["8th", "6th", "Union Square", "3rd", "1st"],
#    :s => ["Grand Central" , "33rd", "28th", "23rd", "Union Square", "Astor Place"]
# }

# def menu

#   puts "Welcome, which NYC Subway line would like to go on"
#   puts "line (n) "
#   puts "line (l) "
#   puts "line (s) "
#   puts "Or (q)uit"
#     puts = gets.chomp.downcase

# end

#   user_choice = menu
#   #binding.pry 
#   if user_choice == "n"
#       puts " You have Picked Line (n)"
#         puts "================"
#         puts  " Here are the stops on this line!"
#       lines[:n].each{|x| puts x} 
      
#        puts  " Please select your departure"
#             start = gets.chomp
#       puts " You selcetd #{start}"
      
#         puts "Please select your destination"
#              finish = gets.chomp
#         puts " You selected #{finish}"  
      
   
            
#        first_stop = lines[:n].index start
#        last_stop = lines[:n].index finish
#        trip = lines[:n][first_stop..last_stop] 

#        p first_stop
#        p last_stop 
#        p trip.length

#        p trip.join(', ')


     

      
#     elsif user_choice == "l"
#       puts " You have Picked Line (l)"
#       lines[:l].each{|x| puts x}
#         puts  " Here are the stops on this line!"
#         puts  " Please select your departure"
#               start = gets.chomp
#         puts " You selcetd #{start}"
        
#         puts "Please select your destination"
#              finish = gets.chomp
#         puts " You selected #{finish}"  
      
#         first_line = lines[:l]
#         hash = Hash[first_line.map.with_index.to_a]
#          x = hash["#{start}"]
#          y = hash["#{finish}"]
#          p hash.rand(x..y).map
#          number_of_stops = y - x 
#          puts  " there are #{number_of_stops} stops to your destination"
      
#       elsif user_choice == "s"
#         puts " You have Picked Line (s)"
#         lines[:s].each{|x| puts x} # the each function shows x in the array
#         puts  " Here are the stops on this line!"
#         puts  " Please select your departure"
#               start = gets.chomp
#         puts " You selcetd #{start}"
        
#         puts "Please select your destination"
#              finish = gets.chomp
#         puts " You selected #{finish}"  
      
#         first_line = lines[:s]
#         hash = Hash[first_line.map.with_index.to_a]
#          x = hash["#{start}"]
#          y = hash["#{finish}"]
         
#          number_of_stops = y - x 
#          puts  " there are #{number_of_stops} stops to your destination"
      
         
#      else user_choice == "q"
#       puts "Quiting"
#       Kernel.exit
#   end
 

#      while true
#          menu
#          break user_choice = false

#       end






# a = first_line[0]
#          # b = first_line[4] 
#          # # p x = lines[:n][1]
#          # # p y = lines[:n][4]
#          # #first_line[a..b].each{|i| puts i}
#          # #(a..b).select{|x| puts x}
#          # #number_of_stations.select{|a , b| x }
        
#         #first_line.select{s}


#          #first_line[0..4].each { |x| puts x }


      # first_line = lines[:n]
      # hash = Hash[first_line.map.with_index.to_a]
      # x = hash["#{start}"]
      # y = hash["#{finish}"]

      # puts  x
      # puts  y

      # puts y - x 
    

# Hash[]







