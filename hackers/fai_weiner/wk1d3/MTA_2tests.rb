lines = {
  :SIX => "6 line",
  :L => "l line",
  :N => "n line"
}
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

dup_stations_full = {
  "union square" => "6 line",
  "23rd" => "6 line",
  "28th" => "6 line",
  "union square" => "l line",
  "8th" => "l line",
  "8th" => "n line",
  "union square" => "n line",
  "23rd" => "n line",
  "28th" => "n line" 
} # Not ideal: will need updates additional (duplicate) stations get added to the network.

## Get USER INPUT here.
print "Enter starting line [6], [l] or [n]: "
start_line_input = "6"
start_line_input << " line"
puts "You've selected the #{start_line_input}."
print "Enter starting station: "
start_station = "23rd"
puts start_station
# Error with stations with duplicates
if dup_stations_full.include? start_station
   stations[start_station][:line].stations[start_station][start_line_input] == 
    puts "this is going"
  end
else
  puts "Something else"
  # stations[start_station][:line] 
end