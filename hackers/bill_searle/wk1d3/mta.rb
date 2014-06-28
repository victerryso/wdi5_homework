#start_line
#start_station
#end_line
#end_station
require 'pry'
require 'pry-debugger'
# define the lines in a hash with stations in an array.
lines = {
  'n' => ['times square', '34th', '28th', '23rd', 'union square', '8th N'],
  'l' => ['8th L', '6th', 'union square', '3rd','1st'],
  '6' => ['grand central', '33rd', '28th', '23rd', 'union square','astor place']
}

puts "The N line stops: Times Square, 34th, 28th, 23rd, Union Square, and 8th on N."
puts "The L line stops: 8th on L, 6th, Union Square, 3rd, and 1st."
puts "The 6 line stops: Grand Central, 33rd, 28th, 23rd, Union Square, and Astor Place."

print "Which line are you starting at? "
start_line = gets.chomp.downcase
print "Which stop will you get on? "
start_station = gets.chomp.downcase
print "Which line are you getting off? "
end_line = gets.chomp.downcase
print "Which stop are getting off at? "
end_station = gets.chomp.downcase


start_station = lines[start_line].index start_station # get the index number of the start stop
end_station = lines[end_line].index end_station # get the index number of the last stop

if start_line == end_line && start_station < end_station
    trip = lines[start_line][start_station..end_station] # find the range between the index's on the specified line
    puts "You are getting on at line #{start_line.upcase} stop #{start_station} and getting off at line #{end_line.upcase} stop #{end_station}."
    puts "You will pass though #{trip.join(', ')} stations and the total stops is: #{trip.length}."

  else start_line == end_line
    trip = lines[start_line][end_station..start_station] # find the range between the index's on the specified line
    puts "You are getting on at line #{start_line.upcase} stop #{start_station} and getting off at line #{end_line.upcase} stop #{end_station}."
    puts "You will pass though #{trip.join(', ')} stations and the total stops is: #{trip.length}."
end


if start_line.inlcude? "union square"
    start_station = lines["union square"].index start_station
    trip = lines[start_line][start_station..end_station]




# trip_2 = []


