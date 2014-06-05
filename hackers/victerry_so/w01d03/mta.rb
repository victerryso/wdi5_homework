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

if s_line == f_line # Same Line
  puts "There are #{(lines[s_line].index(s_stop) - lines[f_line].index(f_stop)).abs} stops in between." # Same Line Equation
  puts "#{lines[s_line][lines[s_line].index(s_stop)..lines[f_line].index(f_stop)]}" # Listing Stations
end

if s_line != f_line # Different Line
  puts "There are #{(lines[s_line].index(s_stop) - lines[s_line].index("Union Square")).abs + (lines[f_line].index(f_stop) - lines[f_line].index("Union Square")).abs} stops in between via Union Square." # Different Line Equation
  puts "Line #{s_line} #{lines[s_line][lines[s_line].index(s_stop)..lines[s_line].index("Union Square")]}\nLine #{f_line} #{lines[f_line][lines[f_line].index(f_stop)..lines[f_line].index("Union Square")].reverse}" # Listing Stations
end