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
  :L6 => [:Grand_Central,:L6_33rd,:L6_28th,:L6_23rd,:Union_Square,:L6_Astor_Place],
  :Seven => [:Seven_Queensboro_Plaza, :Seven_Court_Sq, :Seven_Hunters_Point_Avenue, :Seven_Vernon_Boulevard, :Grand_Central]
}
def stop_list_0th (start_index, stop_index, line_and_station, hash)
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
def stops_list_1st(hash, start_station, end_station)
  stops =[]
  common = find_common(hash[start_station[:line]], hash[end_station[:line]])
  start_index = hash[start_station[:line]].index(start_station[:station])
  start_common_index = hash[start_station[:line]].index(common[-1])
  end_index = hash[end_station[:line]].index(end_station[:station])
  end_common_index = hash[end_station[:line]].index(common[-1])
  binding.pry
  #check for station on the same line - replaces comparing :line attribute
  if hash.select{|key, stations|stations.include?(start_station[:station])&&stations.include?(end_station[:station])}
    end_index = hash[start_station[:line]].index(end_station[:station])
    return [stop_list_0th(start_index,end_index,start_station,hash)]
  else
    start_to_common = stop_list_0th(start_index,start_common_index, start_station, hash)
    end_to_common = stop_list_0th(end_index,end_common_index, end_station, hash)
    stops =(start_to_common + end_to_common.reverse).uniq
    return [stops]
  end
end
#multi stop transitions
def stops_list_multi(hash, start_station, end_station)
  visited_common_stations = {
    1 => start_station
  }
  dead_ends = {}
  while !visited_common_stations.values.select{|line_station|line_station.values.include?(end_station[:Line])}
  end
end

def find_common(first_line, second_line)
  first_line&second_line
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
    @stops = stops_list_multi($Lines, start_station, stop_station).flatten.uniq
  end
  erb :form
end

