require "pry"
require "pry-debugger"

lines = {
  "3" => ["125th", "116th", "Central Park North", "96th", "77nd", "Times Square", "34th(3)"],
  "N" => ["Times Square", "34th", "28th(N)", "23rd(N)", "Union Square", "8th(N)"], # Line N in Hash
  "L" => ["8th(L)", "6th", "Union Square", "3rd", "1st"], # Line L in Hash
  "6" => ["Grand Central", "33rd", "28th(6)", "23rd(6)", "Union Square", "Astor Place"] # Line 6 in Hash
}

intersections = ["Times Square", "Union Square"]

puts "\nLine 3 #{lines["3"]}\nLine N #{lines["N"]}\nLine L #{lines["L"]}\nLine 6 #{lines["6"]}\n\n" # Options
print "Starting Stop: "; s_stop = gets.chomp.to_s # Starting Stop
print "Finishing Stop: "; f_stop = gets.chomp.to_s # Finishing Stop

s_line = lines.select {|line, stop| stop.include? s_stop }.keys.join # Searching to see which line the stop belongs to
f_line = lines.select {|line, stop| stop.include? f_stop }.keys.join
s_line = f_line if intersections.include?s_stop # If you choose a stop which is an intersection, s_line = f_line
f_line = s_line if intersections.include?f_stop

if (lines[s_line] & lines[f_line]).empty?
  # c_line = lines.select {|line, stop| stop.include?s_stop, f_stop}.keys.join
  c_line = lines[((lines[s_line] & intersections) & (lines[f_line] & intersections)).join]
  cross_1 = (lines[s_line] & intersections).join
  cross_2 = (lines[f_line] & intersections).join
else
  cross = (lines[s_line] & lines[f_line]).join # Finding an intersection for 1 intersection
end


s = lines[s_line].index(s_stop) # Index number for Start
f = lines[f_line].index(f_stop) # Index number for Finish
binding.pry
s_cross = lines[s_line].index(cross_1) # Index number for Exchange
f_cross = lines[f_line].index(cross_2)
c1 = lines[c_line].index(cross_1)
c2 = lines[c_line].index(cross_2)

if s_line == f_line # Same Line Condition
  puts "There are #{(s - f).abs} stops in between." # Same Line Equation for no. stops
  puts "#{lines[s_line][s..f]}" if s < f # Listing stations
  puts "#{lines[f_line][f..s].reverse}" if s > f # Listing stations in case it's backwards.
else # Different Line Condition
  puts "There are #{(s - s_cross).abs + (c1 - c2).abs + (f - f_cross).abs} stops in between via #{cross}."
  puts "Line #{s_line} #{lines[s_line][s..s_cross]}" if s < s_cross
  puts "Line #{s_line} #{lines[s_line][s_cross..s].reverse}" if s > s_cross
  puts "Line #{c_line} #{lines[c_line][c1..c2]}" if c_line.exist?
  puts "Line #{f_line} #{lines[f_line][f..f_cross].reverse}" if f < f_cross
  puts "Line #{f_line} #{lines[f_line][f_cross..f]}" if f > f_cross
end