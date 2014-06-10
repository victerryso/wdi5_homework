lines = {
  :n => {'Times Square' => 1, '34th' => 2, '28th' => 3, '23rd' => 4, 'Union Square' => 5, '8th' => 6},
  :l => {'8th' => 3, '6th' => 4, 'Union Square' => 5, '3rd' => 6, '1st' => 7},
  :six => {'Grand Central' => 1, '33rd' => 2, '28th' => 3, '23rd' => 4, 'Union Square' => 5, 'Astor Place' => 6}
}

p "Are you on n, l or six?"
  line1 = gets.chomp
p "What Station are you at?"
  current_location = gets.chomp
p "Is your destination on n, l or six?"
  line2 = gets.chomp
p "What Station are you going to?"
  destination = gets.chomp

station = lines[line1.to_sym][current_location]
station2 = lines[line2.to_sym][destination]
list = lines[line1.to_sym][current_location]..lines[line2.to_sym][destination]

stops = station2 - station
if stops < 0
  stops = stops + station
  p "There are #{stops} stops between #{current_location} and #{destination} #{list}"
else
p "There are #{stops} stops between #{current_location} and #{destination}"
end
