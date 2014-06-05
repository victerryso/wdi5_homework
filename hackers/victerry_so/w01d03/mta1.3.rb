lines = {
  "N" => ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"], # Line N in Hash
  "L" => ["8th", "6th", "Union Square", "3rd", "1st"], # Line L in Hash
  "6" => ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"] # Line 6 in Hash
}

puts "\nLine N #{lines["N"]}\nLine L #{lines["L"]}\nLine 6 #{lines["6"]}\n\n" # Options
print "Starting Line: "; s_line = gets.chomp.to_s.capitalize # Starting Line
print "Starting Stop: "; s_stop = gets.chomp.to_s # Starting Stop
print "Finishing Line: "; f_line = gets.chomp.to_s.capitalize # Finishing Line
print "Finishing Line: "; f_stop = gets.chomp.to_s # Finishing Stop

s = lines[s_line].index(s_stop) # Index number for Start
f = lines[f_line].index(f_stop) # Index number for Finish
s_union = lines[s_line].index("Union Square") # Index number for Exchange
f_union = lines[f_line].index("Union Square")

if s_line == f_line # Same Line Condition
  puts "There are #{(s - f).abs} stops in between." # Same Line Equation for no. stops
  puts "#{lines[s_line][s..f]}" if s < f # Listing stations
  puts "#{lines[f_line][f..s].reverse}" if s > f # Listing stations in case it's backwards.
else # Different Line Condition
  puts "There are #{(s - s_union).abs + (f - f_union).abs} stops in between via Union Square."
  puts "Line #{s_line} #{lines[s_line][s..s_union]}" if s < s_union
  puts "Line #{s_line} #{lines[s_line][s_union..s].reverse}" if s > s_union
  puts "Line #{f_line} #{lines[f_line][f..f_union].reverse}" if f < f_union
  puts "Line #{f_line} #{lines[f_line][f_union..f]}" if f > f_union
end