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


  if @start_line == @end_line && @start_station < @end_station
     @trip = $lines[@start_line][@start_station..@end_station] # find the range between the index's on the specified line
     @trip_stations = @trip
     @trip_length = @trip.length
     # @trip_length = @trip.length
     # @trip_join = @trip.join(' ')
  else
     @start_line == @end_line
     @trip = $lines[@start_line][@end_station..@start_station] # find the range between the index's on the specified line
     # @trip_length = @trip.length
     # @trip_join = @trip.join(' ')
  end

# below section 'works' the same as above but counts to union square and from union square.
# then adds the two trip lengths together in to @trip.
# trip_length and trip_join were a test because it was erroring in results.rb

  # if @start_line != @end_line && @start_station < @intersect1
  #   @trip1 = $lines[@start_line][@start_station..@intersect1]
  #   @trip2 = $lines[@end_line][@intersect2..@end_station]
  #   @trip = @trip1.length + @trip2.length
  #   # @trip_length = @trip.length
  #   # @trip_join = @trip.join(', ')
  # else
  #   @start_line != @end_line
  #   @trip1 = $lines[@start_line][@intersect1..@start_station]
  #   @trip2 = $lines[@end_line][@end_station..@intersect2]
  #   @trip = @trip1.length + @trip2.length
  # end
  binding.pry
  erb :results
end
