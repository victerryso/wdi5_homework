lines = {
  :N =>['TS', '34th', '28th', '23rd', :US, '8th'],
  :L =>['8th', '6th', :US, '3rd', '1st'],
  6 => ['GC', '33rd', '28th', '23rd', :US, 'AP']
}

USER = 'yes' # Loops while user wants to use the program

while USER == 'yes'
  # Asking user to put the lines and stations they want to start and end at
  puts "What line would you like to take (N, L or 6)?"
  USER_LINE = gets.chomp
  puts "What is your first stop? "
  USER_START = gets.chomp
  puts "What line is your destination on (N, L or 6)?"
  END_USER_LINE = gets.chomp
  puts "What is your end destination? "
  USER_END = gets.chomp

# Defining which line the user is taking and assigning the index of the array or stops
  if USER_LINE == 'N' || END_USER_LINE == 'N'
    USER_LINE = :N
    LINE_INDEX = 0
    UNION_SQUARE = 4

  end

  if USER_LINE == 'L' || END_USER_LINE == 'L'
    USER_LINE = :L
    LINE_INDEX = 1
    UNION_SQUARE = 2
  end

  if USER_LINE == '6' || END_USER_LINE == '6'
    USER_LINE = 6
    LINE_INDEX = 2
    UNION_SQUARE = 4
  end

  if USER_START == 'US'
     USER_START = :US
  end

  if USER_END == 'US'
     USER_END = :US
  end

  START_STATION = lines.values[LINE_INDEX].index USER_START
  END_STATION = lines.values[END_USER_LINE].index USER_END

  if USER_LINE != END_USER_LINE

    if START_STATION < UNION_SQUARE
        p trip = lines[USER_LINE][START_STATION...UNION_SQUARE]
        p trip2 = lines[END_USER_LINE][START_STATION...UNION_SQUARE]
        trip_length = trip.length + trip2.length
      else
        p trip = lines[USER_LINE][END_STATION...UNION_SQUARE]
        p trip2 = lines[END_USER_LINE][END_STATION...UNION_SQUARE]
        trip_length = trip.length + trip2.length
    end
      puts "The number of stops in your trip is #{ trip_length } "

   else
    START_STATION = lines.values[LINE_INDEX].index USER_START
    END_STATION = lines.values[LINE_INDEX].index USER_END

    if START_STATION < END_STATION
      p trip = lines[USER_LINE][START_STATION..END_STATION]
    else
      p trip = lines[USER_LINE][END_STATION..START_STATION]
    end
    #puts "The number of stops in your trip is #{ trip.length } "


  puts "The number of stops in your trip is #{ trip.length } "
end

  puts "would you like to plan another trip (Yes/No)? "
    USER = gets.chomp.downcase

    if USER != 'yes'
      Kernel.exit
    end

end
