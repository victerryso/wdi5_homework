lines = {
  :N =>['TS', '34th', '28th', '23rd', :US, '8th'],
  :L =>['8th', '6th', :US, '3rd', '1st'],
  6 => ['GC', '33rd', '28th', '23rd', :US, 'AP']
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

  if user_line == 'N' || end_user_line == 'N'
    line_index = 0
    union_square = 4

  end

  if user_line == 'L' || end_user_line == 'L'
    line_index = 1
    union_square = 2
  end

  if user_line == '6' || end_user_line == '6'
    line_index = 2
    union_square = 4
  end

  if user_start == 'US' || user_end == 'US'
     user_start.to_sym
     user_end.to_sym
  end

  user_line.to_sym
  start_station = lines.values[line_index].index user_start
  end_station = lines.values[end_user_line].index user_end
  p start_station
  p end_station

  if user_line != end_user_line

    if start_station == end_station
        p trip = lines[user_line][end_station...union_square]
        p trip2 = lines[end_user_line][end_station...union_square]
        trip_length = trip.length + trip2.length
      else
        p trip = lines[user_line][start_station...union_square]
        p trip2 = lines[end_user_line][start_station...union_square]
        trip_length = trip.length + trip2.length
    end
      puts "The number of stops in your trip is #{ trip_length } "

  else
    start_station = lines.values[line_index].index user_start
    end_station = lines.values[line_index].index user_end

    if start_station < end_station
      p trip = lines[user_line][start_station..end_station]
    else
      p trip = lines[user_line][end_station..start_station]
    end
    puts "The number of stops in your trip is #{ trip.length } "


  puts "The number of stops in your trip is #{ trip.length } "
end

  puts "would you like to plan another trip (Yes/No)? "
    user = gets.chomp.downcase

    if user != 'yes'
      Kernel.exit
    end

end
