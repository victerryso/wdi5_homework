require 'sinatra'
require 'sinatra/reloader'

$lines = {
 "N" => ["Times Square", "34th on N", "28th on N", "23rd on N", "Union Square", "8th on N"],
 "L" => ["8th on L", "6th", "Union Square", "3rd", "1st"],
 "6" => ["Grand Central", "33rd", "28th on 6", "23rd on 6", "Union Square", "Astor Place"]
}
$all_stops = $lines.map { |line_name, stops_list| stops_list }.flatten

def trip_section(line_on_trip_section,get_on,get_off)
   return $lines[line_on_trip_section][get_on..get_off] if get_on < get_off
   $lines[line_on_trip_section][get_off..get_on].reverse if get_on > get_off
end

def train_journey(stop_on,stop_off,line_on,line_off)
  get_on = $lines[line_on].index stop_on # gets index of stop getting on
  get_off = $lines[line_off].index stop_off # gets index stop getting off
  if line_on == line_off # if the trip is on the same line
      @stops_passed = trip_section(line_on,get_on,get_off)
  else # # find the common station in trip
      @intersect = ($lines[line_on] & $lines[line_off]).join
      intersect_on = $lines[line_on].index @intersect
      intersect_off = $lines[line_off].index @intersect
      first_part_of_trip = trip_section(line_on,get_on,intersect_on)
      next_part_of_trip = trip_section(line_off,intersect_off,get_off)
      @stops_passed ||= [] << first_part_of_trip << next_part_of_trip
      @stops_passed.flatten!.uniq!
  end
  @stops_passed
end

def find_line(stop_given)
  $lines.select {|line, stop| stop.include? stop_given }.keys
end

get '/' do
  if params[:stop_on] != "" && params[:stop_off] != "" && params[:stop_on] != params[:stop_off]
    @line_on = find_line( params[:stop_on] )
    @line_off = find_line( params[:stop_off] )
    @line_on = @line_off if @line_on.length > 1
    @line_off = @line_on if @line_off.length > 1
    train_journey(params[:stop_on], params[:stop_off], @line_on.join, @line_off.join)
  end
  erb :trips
end