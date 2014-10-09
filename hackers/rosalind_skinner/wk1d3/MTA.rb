require 'pry'
require 'pry-debugger'
lines = {
  :N =>['TS', '34th', '28th', '23rd', 'US', '8th'],
  :L =>['8th', '6th', 'US', '3rd', '1st'],
  :"6" => ['GC', '33rd', '28th', '23rd', 'US', 'AP']
}

user = 'yes'

while user == 'yes'
puts "What line would you like to take (N, L or 6)?"
user_line_index = gets.chomp.upcase.to_sym
puts "What is your first stop? "
user_start = gets.chomp
puts "What line is your destination on (N, L or 6)?"
end_user_line = gets.chomp.upcase.to_sym
puts "What is your end destination? "
user_end = gets.chomp.to_s

intersection1 = lines[user_line_index].index 'US'
intersection2 = lines[end_user_line].index 'US'

start_station = lines[user_line_index].index user_start
end_station = lines[end_user_line].index user_end

if user_line_index == end_user_line
  if start_station < end_station
    trip = lines[user_line_index][start_station..end_station]
  else
    trip = lines[user_line_index][end_station..start_station]
  end
  puts "The number of stops in your trip is #{ trip.length } "
else
  if start_station < intersection1
    trip = lines[user_line_index][start_station..intersection1]
  end
  if end_station < intersection2
    trip2 = lines[end_user_line][end_station...intersection2]
    trip2.reverse!
  end
  if start_station > intersection1
    trip = lines[user_line_index][intersection1..start_station]
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
