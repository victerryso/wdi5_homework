#start_line
#start_station
#end_line
#end_station
require 'pry'
require 'pry-debugger'
# define the lines in a hash with stations in an array.
stations = {
  :n => ['times square', '34th', '28th', '23rd', 'unionsquare', '8th'],
  :l => ['8th', '6th', 'unionsquare', '3rd','1st'],
  :six => ['grand central', '33rd', '28th', '23rd', 'unionsquare','astor place']
}

# get user input for starting point and end point.
# starting point
print "Which line are you starting on, 'n', 'l' or 'six'? "
start_line = gets.chomp.downcase
# stops prints out the choice of stops per line
stops = stations[ start_line.to_sym ]
stops.each do |stop|
puts "Please select which station: #{stop}"
end
start_station = gets.chomp.downcase

puts "You are starting from #{start_line} #{start_station}."

# end point
print "Which line are you ending on, 'n', 'l' or 'six'? "
end_line = gets.chomp.downcase
# stops prints out the choice of stops per line
stops = stations[ end_line.to_sym ]
stops.each do |stop|
puts "Please select which station: #{stop}"
end
end_station = gets.chomp.downcase.to_s

puts "You are ending at #{start_line} #{start_station}."

# binding.pry
puts
trip_1 = stations.value[0].index start_station
p trip_1





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

station_count = ""

# puts "Starting at #{start_line} #{start_station} and ending at #{end_line} #{end_station}."

