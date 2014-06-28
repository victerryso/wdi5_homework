require 'pry'
require 'pry-debugger'

lines = {
  :N => ['Times Square', '34th', '28th-N', '23rd-N', 'Union Square', '8th-N'],
  :L => ['8th-L','6th','Union Square','3rd','1st'],
  :SIX => ['Grand Central','33rd','28th-6','23rd-6','Union Square','Astor Place']
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


intersect = (lines[start_line.to_sym] & lines[ending_line.to_sym]).first

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
p "There are #{ total_stops.abs } stops on this train ride."

binding.pry


