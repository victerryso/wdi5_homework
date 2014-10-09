lines = {
  :N =>['TS', '34th', '28th', '23rd', :US, '8th'],
  :L =>['8th', '6th', :US, '3rd', '1st'],
  6 => ['GC', '33rd', '28th', '23rd', :US, 'AP']
}

puts "What is your first stop?"
USER_START = gets.chomp
puts "What is your end destination?"
USER_END = gets.chomp

if USER_START == 'US'
  USER_START = :US
end

if USER_END == 'US'
  USER_END = :US
end

START_STATION = lines.values[0].index USER_START
END_STATION = lines.values[0].index USER_END
# END_STATION = lines.values[0].index :US


if START_STATION < END_STATION
  p trip = lines[:N][START_STATION..END_STATION]
else
  p trip = lines[:N][END_STATION..START_STATION]
end