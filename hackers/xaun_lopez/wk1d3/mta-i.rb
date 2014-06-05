# what stop did user get on at? What stop is user getting of at? = how many stops?
lines = {
  :n => {'Times Square' => 1, '34th' => 2,'28th' => 3, '23rd' => 4, 'Union Square' => 5, '8th' => 6},
  # :l => ['23rd', '18th']
}


puts "Would you like to travel on line:"
puts "(N), (L), or, (6)? "
user_choice = gets.chomp

stops = lines[ user_choice.to_sym ]

# stops.each do |stop|
puts "Here is a list of stops on this line: "
puts "#{ stops }"

puts "What stop are you travelling from? "
origin = gets.chomp.downcase

if origin == 'times square'
  puts "You're at Times Square."
elsif origin == '34th'
  puts "You're at 34th."
elsif origin == '28th'
  puts "You're at 28th."
elsif origin == '23rd'
  puts "You're at 23rd."
elsif origin == 'union square'
  puts "You're at Union Square."
elsif origin == '8th'
  puts "You're at 8th."
end

puts "Where are you going? "
puts "#{ stops }"
destination = gets.chomp.downcase

if destination == 'times square'
  puts "You're going to Times Square."
elsif destination == '34th'
  puts "You're going to 34th."
elsif destination == '28th'
  puts "You're going to 28th."
elsif destination == '23rd'
  puts "You're going to 23rd."
elsif destination == 'union square'
  puts "You're going to Union Square."
elsif destination == '8th'
  puts "You're going to 8th."
end

# station = lines[origin.to_sym][destination]
# station2 = lines[origin.to_sym][destination]

# stops = station2 - station
# if stops < 0
#   stops = stops + station
#   p "There are #{ stops } stops between #{ origin } and #{ destination }."
# else
#   p "There are #{ stops } stops between #{ origin } and #{ destination }."
# end



# lines[:n].index 'Times Square'



# maybe think of using a range. so if i start my journey at index 0 and end my journey at index 5. then my range is(0..5) and if it was going to go backward. write an if statement that says if my first index is higher than my last index then swap the values


