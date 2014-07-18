require 'pry'
require 'pry-debugger'

mta = {
	:n => ['Times Square', '34th_n', '28th_n', '23rd_n', 'Union Square', '8th_n'],
	:l => ['8th_l', '6th_l','Union Square', '3rd_l', '1st_l'],
	:'6' => ['Grand Central', '3rd_6', '28th_6', '23rd_6','Union Square', 'Astor Place']
	}

puts "=======MTA======:
	(n)line
	(l)line
	(6)line
	(q) for exit "
puts "Please chose line to get on: "

dep_line = gets.chomp.to_sym
dep_stops = mta[dep_line] # key value

if  dep_line == :q
		puts "Thank you"
		Kernel.exit
else
	puts "#{dep_line.upcase} Line is stopping at: "
	dep_stops.each do |stop|
	puts "#{stop}"
	end
end

	puts "Please chose the station to get on the line from above: "
	dep_station = gets.chomp.to_s
	#puts dep_station;
	index_dep = mta[dep_line].index(dep_station) # get index number of the station


	puts "Please chose the line you want to get off:"
	arr_line = gets.chomp.to_sym
	arr_stops = mta[arr_line] # key value

	puts "#{arr_line.upcase} Line is stopping at: "
		arr_stops.each do |stop|
		puts "#{stop}"
		end

	puts "Please chose the station you want to get off : "
	arr_station = gets.chomp.to_s
	#puts arr_station
	index_arr = mta[arr_line].index(arr_station) #get index number of the station

	intersection = (mta[dep_line] & mta[arr_line]).first
	# to join the common stops from user choice lines to 1 array:intersection


	if dep_line == arr_line
		# index_dep = mta[dep_line].index(dep_station)
		# #p "it is dep line index #{index_dep}"
		# #for arr line
		# index_arr = mta[arr_line].index(arr_station)
		#user uses same line
		total_stops = (index_arr - index_dep).abs
		puts "Total stops for destination: #{total_stops} "
		if (index_arr - index_dep) > 0 #check the direction
			#join values in the array
			user_stops_dep = mta[dep_line][index_dep+1 .. index_arr]
			puts "Your trip starts from #{mta[dep_line][index_dep]}. The stop stations are: #{user_stops_dep.join(', ')}"

		elsif (index_arr - index_dep) < 0 #check the direction
			mta[dep_line].reverse! # change it reverse direction
			p mta[dep_line]

			r_index_dep = mta[dep_line].index(dep_station)

			r_index_arr = mta[arr_line].index(arr_station)
			#p "it is dep reverse line index #{index_dep}"

			user_stops_dep = mta[dep_line][r_index_dep+1 .. r_index_arr]

			puts "Your trip starts from #{mta[dep_line][r_index_dep]}. The stop stations are: #{user_stops_dep.join(', ')}"
		end

	else #dep_line != arr_line
		intersection_index_dep = mta[dep_line].index(intersection)
		total_stops_dep = (index_dep - intersection_index_dep).abs

		intersection_index_arr = mta[arr_line].index(intersection)
		total_stops_arr = (index_arr - intersection_index_arr).abs


		total_stops = total_stops_dep + total_stops_arr
		puts "Total stops for destination: #{total_stops}"


		if (intersection_index_dep - index_dep)> 0
				user_stops_dep = mta[dep_line][index_dep+1 .. intersection_index_dep]

				if (index_arr - intersection_index_arr)>0 #1
					user_stops_arr = mta[arr_line][intersection_index_arr+1 .. index_arr]
					user_total_stop = user_stops_dep + user_stops_arr
					puts "Your trip starts from #{dep_line.upcase}Line #{mta[dep_line][index_dep]} to #{arr_line.upcase}Line #{mta[arr_line][index_arr]}. Change at #{mta[dep_line][intersection_index_dep]}. The stop stations are: #{user_total_stop.join(', ')}"

				elsif (index_arr - intersection_index_arr)< 0 #2
					mta[arr_line].reverse! # change it reverse direction
					r_index_arr = mta[arr_line].index(arr_station)
					#p "it is dep reverse line index #{index_dep}"
					r_intersection_index_arr = mta[arr_line].index(intersection)

					r_user_stops_arr = mta[arr_line][r_intersection_index_arr+1.. r_index_arr]

					r_user_total_stop = user_stops_dep + r_user_stops_arr
					puts "Your trip starts from #{dep_line.upcase}Line #{mta[dep_line][index_dep]} to #{arr_line.upcase}Line #{mta[arr_line][r_index_arr]}. Change at #{mta[dep_line][intersection_index_dep]}. The stop stations are: #{r_user_total_stop.join(', ')}"

				end



		elsif (intersection_index_dep - index_dep)< 0 #dep line is reverse direction #3
				mta[dep_line].reverse! # change it reverse direction

				r_index_dep = mta[dep_line].index(dep_station)
				r_intersection_index_dep = mta[dep_line].index(intersection)
				r_user_stops_dep = mta[dep_line][r_intersection_index_dep .. r_index_dep]


				if (index_arr - intersection_index_arr)>0

					user_stops_arr = mta[arr_line][intersection_index_arr .. index_arr]

					user_total_stop = r_user_stops_dep + user_stops_arr


					puts "Your trip starts from #{dep_line.upcase}Line #{mta[dep_line][r_index_dep]} to #{arr_line.upcase}Line #{mta[arr_line][index_arr]}. Change at #{mta[dep_line][r_intersection_index_dep]}. The stop stations are: #{user_total_stop.join(', ')}"

				elsif (index_arr - intersection_index_arr)<0
					mta[arr_line].reverse! # change it reverse direction
					r_index_arr = mta[arr_line].index(arr_station)
					#p "it is dep reverse line index #{index_dep}"
					r_intersection_index_arr = mta[arr_line].index(intersection)

					r_user_stops_arr = mta[arr_line][r_intersection_index_arr.. r_index_arr]

					r_user_total_stop = r_user_stops_dep + r_user_stops_arr
					puts "Your trip starts from #{dep_line.upcase}Line #{mta[dep_line][index_dep]} to #{arr_line.upcase}Line #{mta[arr_line][r_index_arr]}. Change at #{mta[dep_line][intersection_index_dep]}. The stop stations are: #{r_user_total_stop.join(', ')}"

				end

	  	end
	end






