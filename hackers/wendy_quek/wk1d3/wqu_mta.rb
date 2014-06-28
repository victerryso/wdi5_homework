# This program is based on 3 subway lines:
# The n line with stations of Times Square, 34th, 28th, 23rd, Union Square, and 8th
# The l line with stations of 8th, 6th, Union Square, 3rd, and 1st
# The six line with stations of Grand Central, 33rd, 28th, 23rd, Union Square, and Astor Place.
# The program takes the line and stop that a user is getting on at and the line and stop that user 
# is getting off at and prints the total number of stops for the trip.
#=================================================================================================
# Stations and lines definition
n = ["timessquare", "34th","28th","23rd","unionsquare","8th"]
l = ["8th", "6th", "unionsquare","3rd","1st"]
six = ["grandcentral","33rd","28th","23rd","unionsquare","astorplace"]
mta = {:n=>n, :l=> l, :six=>six}
# Clears screen and displays menu to user 
puts `clear`
puts "=========================="
puts "        atmyn6ln          "
puts "=========================="
puts "\nPlease select from the train stations below,"
puts "to calculate the number of stops for your journey: "
p "n line : " + n.join(' ')
p "l line : " + l.join(' ')
p "six line : " + six.join(' ')
# Request user input of destination and origin stations and linesof travel
puts "\nWhat is your destination station ?"
destination = gets.strip.chomp.downcase.delete(" ")
puts "What line is that destination station on?"
destinationline = gets.strip.chomp.downcase.delete(" ")
puts "What station will you be departing from?"
origin = gets.strip.chomp.downcase.delete(" ")
puts "What line is that origin station on?"
originline = gets.strip.chomp.downcase.delete(" ")
# Result display of how many stops for journey
puts "Your journey is a total of #{(mta[originline.to_sym].index(origin) - mta[originline.to_sym].index("unionsquare")).abs} stop(s) until Unionsquare"
puts "After which you have #{(mta[destinationline.to_sym].index(destination) - mta[destinationline.to_sym].index("unionsquare")).abs} stops till #{destination} station on the #{destinationline} line."	
#================================================================================================
#eof


 