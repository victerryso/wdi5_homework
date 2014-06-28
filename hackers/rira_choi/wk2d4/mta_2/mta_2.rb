require 'pry'
require 'pry-debugger'

lines = {
  :N => ['Times Square', '34th', '28th', '23rd', 'Union Square', '8th'],
  :L => ['8th','6th','Union Square','3rd','1st'],
  :SIX => ['Grand Central','33rd','28th','23rd','Union Square','Astor Place'],
  :J => ['Campsie','Hawthorne','27th','Union Square', '6th', '19th', 'Liverpool']
}

p "------------------------------ Welcome to GA Subway -------------------------------------+"
p "[N ---line]   |Times Square|--|34th|---|28th-N|---|23rd-N|---| Union Square |---|8th-N|--|"
p "[L ---line]   |8th-L|-------|6th|-------|  Union Square |-------|3rd|-------|1st|--------|"
p "[SIX -line]   |Grand Central|--|33rd|--|28th-6|--|23rd-6|--| Union Square |--|Astor Place|"
p "-----------------------------------------------------------------------------------------+ "
p "What line are you starting at?"
start_line = gets.chomp.to_sym.upcase
p "What stop are you getting on at?"
start_stop = gets.chomp
p "What line are you ending at?"
ending_line = gets.chomp.to_sym.upcase
p "What stop are you getting off at?"
ending_stop = gets.chomp


intersect = "Union Square"

start_index = 0
end_index = 0
intersect_start_index = 0
intersect_end_index = 0


lines[start_line.to_sym].each_with_index { |val, index|
  start_index = index if val == start_stop
  intersect_start_index = index if val == intersect
  }
lines[ending_line.to_sym].each_with_index { |val, index|
  end_index = index if val == ending_stop
  intersect_end_index = index if val == intersect
  }


if start_line == ending_line
  total_stops = end_index - start_index
else start_line != ending_line
  stops_to_intersect = intersect_start_index - start_index
  stops_from_intersect = intersect_end_index - end_index
  total_stops = stops_to_intersect.abs + stops_from_intersect.abs
end
# p "#{ intersect }, #{ start_index }, #{ end_index }/ #{stops_to_intersect}, #{stops_from_intersect}"
# .length - index = counting backwards
#Reverse the order of the array if the start stop is after the union/intersection stop
if start_index > intersect_start_index
  # Revrse the array
  lines[start_line].reverse!
  # array length is always start from 1, need to factor in index 0
  lsl = lines[start_line].length - 1
  # start index = length - position of start index
  start_index = lsl - start_index
  # do the same for the intersection
  intersect_start_index = lsl - intersect_start_index
end

#Reverse order if end_index is before the union/intersection stop
if end_index < intersect_end_index
  lines[ending_line].reverse!
  lel = lines[ending_line].length - 1
  end_index = lel - end_index
  intersect_end_index = lel - intersect_end_index
end
puts intersect
# Show stops from Start -> Union
puts "Stops along the #{start_line} :"
(start_index..intersect_start_index).each do | index |
  puts "--#{lines[start_line][index]}"
end

# Show stops from Union -> End
if start_line != ending_line
    puts "Stops along the #{ending_line} :"
    (intersect_end_index..end_index).each do | index |
    puts "--#{lines[ending_line][index]}"
  end
end

binding.pry




