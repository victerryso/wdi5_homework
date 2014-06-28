

lines = {
  :N => ['Times Square', '34th', '28th', '23rd', 'Union Square', '8th'],
  :L => ['8th','6th','Union_Square','3rd','1st'],
  :SIX => ['Grand Central','33rd','28th','23rd','Union Square','Astor Place']
}

p "(N) 'Times Square', '34th', '28th', '23rd', 'Union Square', '8th' "
p "(L) '8th','6th','Union Square','3rd','1st' "
p "(SIX) 'Grand Central','33rd','28th','23rd','Union Square','Astor Place' "
puts " "
p "What line are you starting at?"
start_line = gets.chomp
p "What stop are you getting on at?"
start_stop = gets.chomp
p "What line are you ending at?"
ending_line = gets.chomp
p "What stop are you getting off at?"
ending_stop = gets.chomp


sindex = 0
eindex = 0
intersect_start_index = 0
intersect_end_index = 0


"Union_Square" = :Union_Square
if start_line != ending_line
   intersect = (lines[start_line.to_sym] & lines[ending_line.to_sym]).to_sym.first
end

lines[start_line.to_sym].each_with_index { |val, index|
  if val == start_stop
     sindex = index
  else val == intersect
     intersect_start_index = index
  end
}

lines[ending_line.to_sym].each_with_index { |val, index|
  if val == ending_stop
     eindex = index
  else val == intersect
     intersect_end_index = index
  end
}


if start_line == ending_line
   stops = eindex - sindex

else
  stops_to_intersect =  intersect_start_index - sindex
  stops_from_intersect = intersect_end_index - eindex
  stops = stops_to_intersect.abs + stops_from_intersect.abs

end

p "There are #{stops} stops on this train ride."




