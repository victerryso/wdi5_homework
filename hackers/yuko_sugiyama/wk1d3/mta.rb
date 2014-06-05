lines = {
	:n => ['Times Square', '34th', '28th', '23rd', 'Union Square', '8th'],
	:l => ['8th', '6th','Union Square', '3rd', '1st'],
	:'6' => ['Grand Central', '3rd', '28th', '23rd','Union Square', 'Astor Place']
	}

puts "which line will you use? 
	(n)line 
	(l)line 
	(6)line
	(q) for exit "	

user_choice = gets.chomp.to_sym
stops = lines[user_choice] # key value 


if user_choice == :q
		puts "Thank you"
		Kernel.exit
	
else	
	puts "#{user_choice.upcase} Line is stopping at: "
	stops.each do |stop|
	puts "#{stop}"
	end
end

puts "Please chose the station to get on the line from above: "
dep_station = gets.chomp.to_s
#puts dep_station; 
index_dep = lines[user_choice].index(dep_station) # get index number of the station

puts "Please chose the station you get off: "
arr_station = gets.chomp.to_s
#puts arr_station
index_arr = lines[user_choice].index(arr_station) 

if (index_arr - index_dep) > 0 #check the direction
	puts "Total number of stop is: #{index_arr - index_dep} "
	

	puts "The stop stations are: #{}"#under construction 
end

	
