#start_line
#start_station
#end_line
#end_station
require 'pry'
require 'pry-debugger'
# define the lines in a hash with stations in an array.
lines = {
  'n' => ['times square', '34th', '28th', '23rd', 'unionsquare', '8th'],
  'l' => ['8th', '6th', 'unionsquare', '3rd','1st'],
  '6' => ['grand central', '33rd', '28th', '23rd', 'unionsquare','astor place']
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

# trip_2 = []




# # # define the starting_line to hash
# # case
# #   when start_line == "n_train"
# #     start_line = :n_train
# #   when start_line == "l_train"
# #     start_line = :l_train
# #   when start_line == "six_train"
# #     start_line = :six_train
# # end

# # #look up the position of the start station
# # stops = start_line[ ]

# # # case
# # #   when start_line == :n_train
# # #     :n_train.include? start_station





# print "Which station are you ending at? "
# end_station = gets.chomp.downcase.to_s

# # define the end_line to hash
# case
#   when end_line == "n_train"
#     end_line = :n_train
#   when end_line == "l_train"
#     end_line = :l_train
#   when end_line = "six_train"
#     end_line = :six_train
# end

 # look up the length of the start_line

# station_count = ""

# puts "Starting at #{start_line} #{start_station} and ending at #{end_line} #{end_station}."

