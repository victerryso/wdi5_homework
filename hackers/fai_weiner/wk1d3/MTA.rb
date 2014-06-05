# l_n = { "time square" => 4, "34th" => 3, "28th" => 2, "23th" => 1, :unionsquare => 0, "8th" => 1 }
# l_6 = { "grand central" => 4, "33rd" => 3, "28th" => 2, "23rd" => 1, :unionsquare =>0, "astor place" => 1 }
# l_L = { "8th" => 2 , "6th" => 1, :unionsquare => 0, "3rd" => 1, "1st" => 2 }

# print "Which stop is your starting point? "
# start_station = gets.chomp.downcase

# print "Which stop is your destination? "
# stop = gets.chomp.downcase


# 1. What is the line of the start station? #{start_line}
# 2. What is the line of the stop line? #{stop_line}

# Does (stop_line) == start_line
# if yes... max[(start_station(station(value)), stop_station(station(value))] - min [(start_station(station(value)), stop_station(station(value))]
# else ... start_station(station(value)) + stop_station(station(value))
# end

# lines.each do |line| 
#   line.each do |station, value|
#     if station == start_station
#       sta_loc = station
#       puts value
#     end
#     puts 
#   end
# end

# lines = { 
#   :l_n => {"time square", "34th", "28th", "23rd", :unionsquare, "8th"],
#   :l_6 => ["grand central", "33rd", "28th", "23rd", :unionsquare, "astor place"],
#   :l_l => ["8th", "6th", :unionsquare, "3rd", "1st"]
# }


stations = {
  "astor place" => {:line => "6 line", :position => -1},
  "union square_6" => {:line => "6 line", :position => 0}, 
  "23rd_6" => {:line => "6 line", :position => 1}, 
  "28th_6" => {:line => "6 line", :position => 2}, 
  "33rd" => {:line => "6 line", :position => 3}, 
  "grand central" => {:line => "6 line", :position => 4}, 
  "1st" => {:line => "l line", :position => -2}, 
  "3rd" => {:line => "l line", :position => -1}, 
  "union square_l" => {:line => "l line", :position => 0}, 
  "6th" => {:line => "l line", :position => 1}, 
  "8th_l" => {:line => "l line", :position => 2}, 
  "8th_n" => {:line => "n line", :position => -1},  
  "union square_n" => {:line => "n line", :position => 0}, 
  "23rd_n" => {:line => "n line", :position => 1}, 
  "28th_n" => {:line => "n line", :position => 2}, 
  "34th" => {:line => "n line", :position => 3}, 
  "times square" => {:line => "n line", :position => 4} 
}


# STATIONS hash contains all stops each with line ID and # of position from Union Square.
N = [ "time square", "34th", "28th", "23rd", :unionsquare, "8th" ]
SIX = [ "grand central", "33rd", "28th", "23rd", :unionsquare, "astor place" ]
L = [ "8th", "6th", :unionsquare, "3rd", "1st" ]

# Turn lines to symbols for easy search
lines = {}
lines[:N] = N
lines[:SIX] = SIX
lines[:L] = L


# print "Which stop is your starting point? "
# start_station = gets.chomp.downcase

# # puts sta_loc[start_station].to_i

# print "Which stop is your destination? "
# dest_station = gets.chomp.downcase

# puts sta_loc[dest_station].to_i


# num_stop = l_N[start_station] + l_N[dest_station]

# puts ""
# puts "You will have to go through #{num_stop}."