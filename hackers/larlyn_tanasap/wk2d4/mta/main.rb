require 'pry'
require 'sinatra'
require 'sinatra/reloader'

$lines = {
 # "3" => ["125th","116th","Central Park North", "96th", "77nd","Times Square","34th on 3"],
 "N" => ["Times Square", "34th on N", "28th on N", "23rd on N", "Union Square", "8th on N"],
 "L" => ["8th on L", "6th", "Union Square", "3rd", "1st"],
 "6" => ["Grand Central", "33rd", "28th on 6", "23rd on 6", "Union Square", "Astor Place"],
 # "7" => ["Queensboro Pl", "Court Sq", "Hunters Pt Ave", "Vernon Boulevard", "Grand Central"]
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
  $lines.select {|line, stop| stop.include? stop_given }.keys.join
end

def find_line_for_common(line_to_check,opposite_stop)
  common_stop_lines = line_to_check.split"" ## => ["3","N"] for Times square, want to go to 1st on L
  line_to_check = common_stop_lines & $lines.select {|line, stop| stop.include? opposite_stop }.keys # => needs to return N\
  line_to_check.join
end

get '/' do
  if params[:stop_on] != "" && params[:stop_off] != "" && params[:stop_on] != params[:stop_off]
    @line_on = find_line( params[:stop_on] )
    @line_off = find_line( params[:stop_off] )
      if @line_on.length > 1 && @line_on.length > 1 #find for two common station
        @line_on = $lines.select {|line, stop| ( stop.include? params[:stop_on] ) && ( stop.include? params[:stop_off]) }.keys.join
        @line_off = $lines.select {|line, stop| ( stop.include? params[:stop_on] ) && ( stop.include? params[:stop_off] ) }.keys.join
      elsif @line_on.length > 1 ## CHECK IF THE STATION IS COMMON TO OTHER LINES
        @line_on = find_line_for_common(@line_on,params[:stop_off])
      elsif @line_off.length > 1
        @line_off = find_line_for_common(@line_off,params[:stop_on])
      end
      ## fix for a common stop to uncommon switching lines. at this point line_on is nil of the 1st stop is common
      ## because the checks above only deal with common station to uncommon /on the same line./
      ## test for 77th to union sq, need @line_off # => "N"
      # @line_on ||= ??
      # @line_off ||= ??
    train_journey(params[:stop_on], params[:stop_off], @line_on, @line_off)
  end
  erb :trips
end