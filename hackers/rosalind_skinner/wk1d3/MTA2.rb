lines = {
  :N =>['TS', '34th', '28th', '23rd', 'US', '8th'],
  :L =>['8th', '6th', 'US', '3rd', '1st'],
  6 => ['GC', '33rd', '28th', '23rd', 'US', 'AP']
}

user = 'yes'

while user == 'yes'
puts "What line would you like to take (N, L or 6)?"
user_line = gets.chomp
puts "What is your first stop? "
user_start = gets.chomp
puts "What line is your destination on (N, L or 6)?"
end_user_line = gets.chomp
puts "What is your end destination? "
user_end = gets.chomp

# if user_line == 'N'
#   user_line.to_sym
#   line_index = 0
# end

# if user_line == 'L'
#   user_line.to_sym
#   line_index = 1
# end

# if user_line == '6'
#   user_line.to_sym
#   line_index = 2
# end

p user_line = user_line.to_sym
p line[user_line]

start_station = lines.values[line_index].index user_start
end_station = lines.values[line_index].index user_end

if start_station < end_station
  p trip = lines[user_line][start_station..end_station]
else
  p trip = lines[user_line][end_station..start_station]
end

puts "The number of stops in your trip is #{ trip.length } "
puts "would you like to plan another trip (Yes/No)? "
  user = gets.chomp.downcase

  if user != 'yes'
    Kernel.exit
  end
end
