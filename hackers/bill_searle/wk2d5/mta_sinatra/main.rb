require 'pry'
require 'pry-debugger'
require 'sinatra'
require 'sinatra/reloader'

$lines = {
  'n' => ['ts', '34th', '28th', '23rd', 'us', '8th'],
  'l' => ['8th', '6th', 'us', '3rd','1st'],
  '6' => ['gc', '33rd', '28th', '23rd', 'us','ap']
}

get '/' do
  erb :input
end

get '/results' do
params.inspect
  @start_line, @start_station = params["start_option"].split(',')
  @end_line, @end_station = params["end_option"].split(',')


  @start_station = $lines[@start_line].index @start_station # get the index number of the start stop
  @end_station = $lines[@end_line].index @end_station # get the index number of the last stop

  @intersect1 = $lines[@start_line].index 'us'
  @intersect2 = $lines[@end_line].index 'us'

  case
  when
     @start_line == @end_line && @start_station < @end_station
     @trip = $lines[@start_line][@start_station..@end_station] # find the range between the index's on the specified line
     @trip_length = @trip.length
     @trip_stations = @trip.join(', ')
  when
     @start_line == @end_line
     @trip = $lines[@start_line][@end_station..@start_station] # find the range between the index's on the specified line
     @trip_length = @trip.length
     @trip_stations = @trip.join(', ')
  when
    @start_line != @end_line && @start_station < @intersect1
    @trip1 = $lines[@start_line][@start_station..@intersect1]
    @trip2 = $lines[@end_line][@intersect2..@end_station]
    @trip_length = @trip1.length + @trip2.length
    @trip_stations = @trip1.join(', ') + @trip2.join(', ')
  when
    @start_line != @end_line
    @trip1 = $lines[@start_line][@intersect1..@start_station]
    @trip2 = $lines[@end_line][@end_station..@intersect2]
    @trip_length = @trip1.length + @trip2.length
    @trip_stations = @trip1.zip(@trip2).flatten.compact.join(', ')
  end
  binding.pry
  erb :results
end
