require 'pry-debugger'

lines = {
   "3" => ["125th","116th","Central Park North", "96th", "77nd","Times Square","34th on 3"],
   "N" => ["Times Square", "34th on N", "28th on N", "23rd on N", "Union Square", "8th on N"],
   "L" => ["8th on L", "6th", "Union Square", "3rd", "1st"],
   "6" => ["Grand Central", "33rd", "28th on 6", "23rd on 6", "Union Square", "Astor Place"],
   "7" => ["Queensboro Plaza", "Court Sq", "Hunters Point Avenue", "Vernon Boulevard", "Grand Central"]
}

def ask(question)
   puts question
   gets.chomp
end

def restart
   gets.chomp
   start_trip
end

public
def titleize
   broken_stop_name = split ' '
   if broken_stop_name.last.length > 1
      broken_stop_name.map(&:capitalize).join(' ')
   else
      broken_stop_name.pop
      broken_stop_name << split(' ').last.capitalize
      broken_stop_name.join ' '
   end
end

def train_journey(stop_on,stop_off,line_on,line_off,lines)
   get_on = lines[line_on].index stop_on # gets index of stop getting on
   get_off = lines[line_off].index stop_off # gets index stop getting off
   if line_on == line_off # if the trip is on the same line
      if get_on < get_off # return array that's between the two indexes of stops
      stops_passed = lines[line_on][get_on..get_off]
      else
      stops_passed = lines[line_on][get_off..get_on]
      end
   else # # find the common station in trip
      intersect = lines[line_on] & lines[line_off]
      intersect_on = lines[line_on].index intersect.join # needs to change the intersecting station from a one item array to a string
      intersect_off = lines[line_off].index intersect.join
         if get_on < intersect_on
            first_part_of_trip = lines[line_on][get_on...intersect_on]
         else
            first_part_of_trip = lines[line_on][(intersect_on+1)..get_on].reverse
         end
         if get_off < intersect_off # if the get off stop is before the union square on this line
            next_part_of_trip = lines[line_off][get_off..intersect_off].reverse #get the 2nd half in an array and reverse it
         else
            next_part_of_trip = lines[line_off][intersect_off..get_off] #get the second half in an array
         end
         stops_passed = first_part_of_trip << next_part_of_trip
   end
   puts "You want to get on at #{ stop_on } on the #{ line_on } line and get off at #{stop_off } on the #{ line_off } line."
   puts "You will get off #{ stops_passed.flatten.length - 1 } stops later." # flattens because the array is appended is treated as one item
   puts "You will go from #{ stops_passed.flatten!.shift } and stops you will pass are #{ stops_passed.join ", " }."
   gets.chomp
end

def start_trip(lines)
   valid_input = lines.flatten(2)
   all_stops = lines.map { |line_name, stops_list| stops_list }.flatten # map all the stations
   all_common_stops = all_stops.select { |stop| all_stops.count(stop) > 1 }.uniq # map common stops occuring on multiple lines
   puts "\e[H\e[2J"
   puts "=" * 20, "MTA Trip Planner", "=" * 20
   lines.each do |line,stops|
      puts "The #{ line } line has the stops: #{ stops.join(", ")}."
   end
   choice = ask("Type any key to continue, or (q) to quit.").upcase
   if choice == "Q"
      puts "Thanks for using MTA!"
      gets.chomp
      Process.exit
   else
      # unless valid_input.include? choice
         stop_on = ask("Where are you starting?").titleize
            if all_common_stops.include? stop_on
               line_on = ask("What line will you get on?").titleize
            else
               line_on = lines.select {|line, stop| stop.include? stop_on }.keys.join
            end
         stop_off = ask("Where are you going?").titleize
            if all_common_stops.include? stop_off
               line_off = ask("What line will you get off?").titleize
            else
               line_off = lines.select {|line, stop| stop.include? stop_off }.keys.join
            end

         train_journey(stop_on,stop_off,line_on,line_off,lines)
      # else
         # puts "Please enter a valid station and/or line."
      #    restart
      # end
   end
end

start_trip(lines)

#### add trip counter + log via csv
#### add loop to make multi switch trips

## WAY ONE
## make a loop to add how many switches to add to the lines_in_trip array
## find the common stations
## make a loop for each of those common stations to add the trips into the stops array

## WAY two
## while lines in trip have no common stops
##    find the common stop in line_on
##    find the common stop in line_off
##    find the line that has both
##    add that line to the trip
## end