
require 'sinatra'
require 'sinatra/reloader'

$mta = {
		"line_N" =>['Times Square', '34th_n', '28th_n', '23rd_n', 'Union Square', '8th_n'],
		"line_L"=>['8th_l', '6th_l','Union Square', '3rd_l', '1st_l'],
		"line_6" =>['Grand Central', '3rd_6', '28th_6', '23rd_6','Union Square', 'Astor Place']
		}

get '/' do
	@check_direction = 0


erb :form
end

get '/processing' do

	dep_data = params[:dep_station].split(":")
	@dep_line = dep_data[0]
	@dep_station= dep_data[1]
	dep_station_one = @dep_station.split("_")
	@dep_station_pick = dep_station_one[0]


	arr_data = params[:arr_station].split(":")
	@arr_line = arr_data[0]
	@arr_station = arr_data[1]
	arr_station_one = @arr_station.split("_")
	@arr_station_pick = arr_station_one[0]

	intersection = params[:intersection]

	intersection = ($mta[@dep_line] & $mta[@arr_line]).first

	@index_dep = $mta[@dep_line].index(@dep_station)
	@index_arr = $mta[@arr_line].index(@arr_station)
	@total_stops = (@index_arr - @index_dep).abs

  @check_direction = @index_arr - @index_dep

	@user_stops_dep = $mta[@dep_line][@index_dep+1 .. @index_arr]
	@user_stops = @user_stops_dep.join(' -> ')

	@user_choice_dep = $mta[@dep_line][@index_dep]
	@user_choice_arr = $mta[@arr_line][@index_arr]

	@r_dep_array = $mta[@dep_line].reverse
	@r_arr_array = $mta[@arr_line].reverse
	@r_index_dep = @r_dep_array.index(@dep_station)
	@r_index_arr = @r_arr_array.index(@arr_station)

	@r_user_stop_dep = @r_dep_array[@r_index_dep+1 .. @r_index_arr]

	@r_user_stops = @r_user_stop_dep.join(' -> ')

	@intersection_index_dep = $mta[@dep_line].index(intersection)

	total_stops_dep_two = (@index_dep - @intersection_index_dep).abs

	@intersection_index_arr = $mta[@arr_line].index(intersection)

	total_stops_arr_two = (@index_arr - @intersection_index_arr).abs

	@total_stops_two = total_stops_dep_two + total_stops_arr_two

	user_stops_dep_two = $mta[@dep_line][@index_dep +1 .. @intersection_index_dep]

	user_stops_arr_two = $mta[@arr_line][@intersection_index_arr+1 .. @index_arr]

	user_total_stop_two = user_stops_dep_two + user_stops_arr_two

	@user_total_stops_two = user_total_stop_two.join(' -> ')

r_intersection_index_arr = @r_arr_array.index(intersection)

r_user_stops_arr = @r_arr_array[r_intersection_index_arr+1.. @r_index_arr]

r_user_total_stop = user_stops_dep_two + r_user_stops_arr

@r_user_total_stops_two = r_user_total_stop.join(' -> ')


#elsif (intersection_index_dep - index_dep)< 0
@r_intersection_index_dep = @r_dep_array.index(intersection)
r_user_stops_dep = @r_dep_array[@r_index_dep .. @r_intersection_index_dep]

#user stops for arr line (order)
# user_stops_arr_two
# total
rd_user_total_stop = r_user_stops_dep + user_stops_arr_two
@rd_user_total_stops = rd_user_total_stop.join(' -> ')

#(intersection_index_dep - index_dep)< 0 && (intersection_index_arr - index_arr)<0


rda_user_total_stop = r_user_stops_dep + r_user_stops_arr
@rda_user_total_stops = rda_user_total_stop.join(' -> ')

erb :result
end




