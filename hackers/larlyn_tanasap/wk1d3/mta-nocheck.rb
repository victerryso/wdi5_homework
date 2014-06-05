# require 'pry'
lines = {
   "N" => ["Times square", "34th", "28th", "23rd", "Union Square", "8th on N"],
   "L" => ["8th on L", "6th", "Union Square", "3rd", "1st"],
   "6" => ["Grand central", "33rd", "28th", "23rd", "Union Square", "Astor place"]
}

def train_journey(stop_on,stop_off,line_on,line_off,lines)
   get_on = lines[line_on].index stop_on # gets index of stop getting on
   get_off = lines[line_off].index stop_off # gets index stop getting off
   if line_on == line_off # if the trip is on the same line
      stops = lines[line_on][get_on..get_off]
   else
      union_on = lines[line_on].index "Union Square"
      union_off = lines[line_off].index "Union Square"
         if get_off < union_off # if the get off stop is before the union square on this line
            half2 = lines[line_off][get_off..union_off].reverse #get the 2nd half in an array and reverse it
         else
            half2 = lines[line_off][union_off..get_off] #get the second half in an array
         end
      stops = lines[line_on][get_on...union_on] << half2 #appends the second half of the trip in an array
   end
   puts "You want to get on at #{stop_on} on the #{ line_on } line and get off at #{stop_off} on the #{ line_off } line."
   # flattens because the array is appended as an array and gives incorrect length
   puts "You will get off #{ stops.flatten.length - 1 } stops later."
   puts "The stops you will pass are #{ stops.join ", " }."
end

puts "=" * 20, "MTA", "=" * 20
# interpolate from hash in loop
puts "The N line has the following stops: Times Square, 34th, 28th, 23rd, Union Square, and 8th on N."
puts "The L line has the following stops: 8th on L, 6th, Union Square, 3rd, and 1st."
puts "The 6 line has the following stops: Grand Central, 33rd, 28th, 23rd, Union Square, and Astor Place."

puts "Where are you starting?"
stop_on = gets.chomp.capitalize
puts "What line will you get on?"
line_on = gets.chomp.capitalize
puts "Where are you going?"
stop_off = gets.chomp.capitalize
puts "What line will you get off?"
line_off = gets.chomp.capitalize

train_journey(stop_on,stop_off,line_on,line_off,lines)