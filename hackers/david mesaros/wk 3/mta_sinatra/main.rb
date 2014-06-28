require 'pry'
# require 'pry-debugger'
require 'sinatra'
require 'sinatra/reloader'
 
 
$lines = {
  :N =>["Times Square", "34th", "28th", "23rd", "Union Square", "8th" ],
  :L =>["8th", "6th", "Union Square", "3rd", "1st"],
  :"6" => ["Grand Central" , "33rd", "28th", "23rd", "Union Square", "Astor Place"]
}
 
get '/' do
  	erb :home
end

get '/plan' do

		
	if params != nil
		start_user_line = params[:start_user_line].to_sym
		end_user_line = params[:end_user_line].to_sym
		user_start = params[:user_start]
		user_end = params[:user_end]
		trip_length = params[:trip_length]
		
 
		intersection1 = $lines[start_user_line].index 'Union Square'
        intersection2 = $lines[end_user_line].index 'Union Square'

        start_station = $lines[start_user_line].index user_start
        end_station = $lines[end_user_line].index user_end
        

 if start_user_line == end_user_line
  if start_station < end_station
    trip1 = $lines[start_user_line][start_station..end_station]
  else
    trip1 = $lines[start_user_line][end_station..start_station]
  end

  raise 'dfsdf'
  @trip_length = trip1.length #puts "The number of stops in your trip is #{ trip.length } "
  trip_station= trip1.reverse.join(', ') #puts "The stops are : #{trip.join(', ')}"


else
  if start_station < intersection1
    trip = lines[start_user_line][start_station..intersection1]
  end
  if end_station < intersection2
    trip2 = lines[end_user_line][end_station...intersection2]
    trip2.reverse!
  end
  if start_station > intersection1
    trip = lines[start_user_line][intersection1..start_station]
    trip.reverse!
  end
  if end_station > intersection2
    trip2 = lines[end_user_line][intersection2...end_station]
  end
  puts "Your stops: #{trip.join(', ')}, #{trip2.join(', ')}"
  puts "The number of stops in your trip is #{ trip.length + trip2.length } "
end



			
	end
	# params.inspect
	erb :home
end 













# $mta = {
# 	:Line_L=>["8th", "6th", "Union Square", "3rd", "1st"],
# 	:Line_N=>["Times Square", "34th", "28th", "23rd", "Union Square", "8th"],
# 	:Line_6=>["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"]
# }
 
# get '/' do
#   	erb :home
# end
# # binding.pry
# # $mta[:Line_N].index "23rd"
# get '/plan' do
# 	unless params != nil
# 		depart_line = params[:departure_line]
# 		depart_station = params[:departure_station]
# 		arrive_line = params[:arrival_line]
# 		arrive_station = params[:arrival_station]
 
# 		departing_station = ($mta[depart_line].index(depart_station)).abs
# 		departing_line_unionsquare = $mta[depart_line].index("Union Square")
 
# 		arriving_station = ($mta[arrive_line].index(arrive_station)).abs
# 		arriving_station_unionsquare = $mta[arrive_line].index("Union Square")
# 		if depart_line == arrive_line
# 			$num_of_stops_destination = (departing_station - arriving_station).abs
# 		else
# 			$num_of_stops_unionsquare = (departing_station - departing_line_unionsquare).abs
# 			$num_of_stops_destination = (arriving_station - arriving_station_unionsquare).abs
# 		end	
# 	end
# 	# params.inspect
# 	erb :home







# end
 