

lines = {
  :n => {'times square' => 1, '34th' => 2, 'n_28th' => 3, 'n_23rd' => 4, 'union square' => 5, '8th' => 6},
  :l => {'8th' => 1, '6th' => 2, 'union square' => 3, '3rd' =>4, '1st' => 5},
  :l6 => {'grand central' => 1, '33rd' => 2, '6_28th' => 3, '6_23rd' => 4, 'union square' => 5, 'astor place' => 6}
}

p "What line are you on? n, l or l6"
  line_menu = gets.chomp
p "what station will you depart from?"
  location_og = gets.chomp
p "what line is your destination on? ( n, l, l6)"
  dest_line = gets.chomp
p "what station are you going to on this line?"
  dest_station = gets.chomp

