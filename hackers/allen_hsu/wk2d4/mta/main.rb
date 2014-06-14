require 'pry'
require 'pry-debugger'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'JSON'
require 'sinatra/cookies'

$Lines = {
  :N => [:N_Times_Square,:N_34th,:N_28th,:N_23rd,:Union_Square,:N8th],
  :L => [:L8th,:L_6th,:Union_Square,:L_3rd,:L_1st],
  :L6 => [:L6_Grand_Central,:L6_33rd,:L6_28th,:L6_23rd,:Union_Square,:L6_Astor_Place]
}
def stops_on_journey (start_index, stop_index, line_and_station, hash)
  stops = []
  number_of_stops = (start_index-stop_index)
  #(begin).step(end,stepsize)
  begin
    (start_index).step(stop_index, stop_index <=> start_index) do |x|
      stops << hash[line_and_station[:line]][x]
    end
  rescue
      stops = []
  end
  stops
end
#stops list returns [stops] or [stops, common]
def stops_list(hash, start_station, end_station)
  stops =[]
  common = hash[start_station[:line]] & hash[end_station[:line]]
  start_index = hash[start_station[:line]].index(start_station[:station])
  start_common_index = hash[start_station[:line]].index(common[-1])
  end_index = hash[end_station[:line]].index(end_station[:station])
  end_common_index = hash[end_station[:line]].index(common[-1])

  if start_station[:line] == end_station[:line]
    return [stops_on_journey(start_index,end_index,start_station,hash)]
  else
    start_to_common = stops_on_journey(start_index,start_common_index, start_station, hash)
    end_to_common = stops_on_journey(end_index,end_common_index, end_station, hash)
    stops =(start_to_common + end_to_common.reverse).uniq
    return [stops, common]
  end
end

def find_line(station, hash)
  station_line = nil
  hash.each do |line, stations|
    station_line = line if stations.include?(station)
  end
  station_line
end

get '/' do
  if params["start-station"] and params["stop-station"]
    @start = params["start-station"].to_sym
    start_station = {
      :line => find_line(@start,$Lines),
      :station => @start
    }
    @stop = params["stop-station"].to_sym
    stop_station = {
      :line => find_line(@stop,$Lines),
      :station => @stop
    }
    @stops = stops_list($Lines, start_station, stop_station).flatten.uniq
  end
  erb :form
end

