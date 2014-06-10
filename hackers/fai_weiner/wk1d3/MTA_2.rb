stations = {
  "astor place" => {
    :line => "6 line", 
    :position => -1},
  "union square" => {
    :line => "6 line", 
    :position => 0}, 
  "23rd" => {
    :line => "6 line", 
    :position => 1}, 
  "28th" => {
    :line => "6 line", 
    :position => 2}, 
  "33rd" => {
    :line => "6 line", 
    :position => 3}, 
  "grand central" => {
    :line => "6 line", 
    :position => 4}, 
  "1st" => {
    :line => "l line", 
    :position => -2}, 
  "3rd" => {
    :line => "l line", 
    :position => -1}, 
  "union square" => {
    :line => "l line", 
    :position => 0}, 
  "6th" => {
    :line => "l line", 
    :position => 1}, 
  "8th" => {
    :line => "l line", 
    :position => 2}, 
  "8th" => {
    :line => "n line", 
    :position => -1},  
  "union square" => {
    :line => "n line", 
    :position => 0}, 
  "23rd" => {
    :line => "n line", 
    :position => 1}, 
  "28th" => {
    :line => "n line", 
    :position => 2}, 
  "34th" => {
    :line => "n line", 
    :position => 3}, 
  "times square" => {
    :line => "n line", 
    :position => 4} 
}

dup_stations = [ "union square", "23rd", "28th", "union square", "8th", "8th", "union square", "23rd", "28th" ] # Come up with a method to find duplicates and automatically add to this array.

public
def titleize(x) 
  x.split(" ").map(&:capitalize).join(" ")
end

def dup_station_check(x)
  dup_stations.include? x
end

## WELCOME MESSAGE
puts "===== MTA Guide =====" 
puts ""
puts "Welcome to your MTA Trip Calculator. Please make your selection below:"
puts "[6 Line] : Grand Central, 33rd, 28th, 23rd, Union Square, and Astor Place"
puts "[L Line] : 8th, 6th, Union Square, 3rd, and 1st"
puts "[N Line] : Times Square, 34th, 28th, 23rd, Union Square, and 8th"
puts ""

## Get USER INPUT here.
print "Enter starting station: "
start_station = gets.chomp.downcase

# def duplicate_checker
# end

if dup_stations.include? start_station # insert duplicate_checker function here to decrease code
  # Looks like the station sits on more than one lines, but will assume that the user will want to take the shortest route
  # Build a loop that will print all position values associated with the station
  puts stations[start_station][:position]
  puts stations[start_station][:position]
  # come up with a method that will compare the value 
  # find the minimum of the two positions (finding the shortest route) and then subtract that
else
  stations[start_station][:line]
end

start_line = stations[start_station][:line] 
start_position = stations[start_station][:position]

## STOPPING STATION INPUT AND CHECKS
print "Enter destination station: "
stop_station = gets.chomp.downcase

if dup_stations.include? stop_station # insert duplicate_checker function here to decrease code
  puts stations[stop_station][:position]
  puts stations[stop_station][:position]
else
  stations[stop_station][:line]
end

stop_line = stations[stop_station][:line] 
stop_position = stations[stop_station][:position]

## COMPARE START AND STOP
if start_line != stop_line
  puts "There are #{stop_position.abs + start_position.abs} stop(s) between #{start_station} and #{stop_station}."
  if dup_stations.include? start_station # insert duplicate_checker function, replace "*_station" here to decrease code
    puts "Take the #{start_station.titleize} from the #{start_line} for the shortest route."
  end
else
  puts "There are #{(stop_position - start_position).abs} stop(s) between #{start_station.titleize} and #{stop_station.titleize}."
end
