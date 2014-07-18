require 'pry'
require 'pry-debugger'
require 'sinatra'
require 'sinatra/reloader'

$network = { 
  "N"=> { "Times Square" => 4, "34th" => 3, "28th" => 2, "23rd" => 1, "Union Square" => 0, "8th" => -1 }, 
  "6" => { "Grand Central" => 4, "33rd" => 3, "28th" => 2, "23rd" => 1, "Union Square" =>0, "Astor Place" => -1 }, 
  "L" => { "8th" => 2 , "6th" => 1, "Union Square" => 0, "3rd" => -1, "1st" => -2 }
}

get '/' do
  $network.sort

  erb :select_stations
end

get '/calculate' do
  start_line, start_station = params["start-station"].split(':')
  @start_line = start_line
  @start_station = start_station

  stop_line, stop_station = params["stop-station"].split(':')
  @stop_line = stop_line
  @stop_station = stop_station

  if start_line != stop_line 
  # condition A.1 : start line not same as stop line
    @stations_calc = $network[start_line][@start_station].abs + $network[stop_line][@stop_station].abs
  else
  # condition A.2 : start line SAME as stop line
    @stations_calc = ($network[stop_line][@stop_station] - $network[start_line][@start_station]).abs
  end

  erb :calculate
end

