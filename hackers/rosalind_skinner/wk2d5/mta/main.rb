require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'

$lines = {
  :N =>['Time Square', '34th', '28th', '23rd', 'Union Square', '8th'],
  :L =>['8th', '6th', 'Union Square', '3rd', '1st'],
  :"6" => ['Grand Central', '33rd', '28th', '23rd', 'Union Square', 'Astor Place']
}

get '/' do

  erb :mta
end

get '/journey/' do
  params.inspect

  unless params.inspect.nil?
    @start_station = params['start_station']
    @end_station = params['end_station']

    @start_station = @start_station.split(',')
    @end_station = @end_station.split(',')

    @start_line = @start_station[0].to_sym
    @start_station = @start_station[1]
    @end_line = @end_station[0].to_sym
    @end_station = @end_station[1]

    @start = $lines[@start_line].index @start_station
    @end = $lines[@end_line].index @end_station

    @intersection1 = $lines[@start_line].index 'Union Square'
    @intersection2 = $lines[@end_line].index 'Union Square'

    if @start_line == @end_line
      if @start < @end
        @trip = $lines[@start_line][@start..@end]
      else
        @trip = $lines[@end_line][@end..@start]
      end
      @trip = @trip.length
    else
      if @start < @intersection1
        @trip = $lines[@start_line][@start..@intersection1]
      end
      if @end < @intersection2
        @trip2 = $lines[@end_line][@end...@intersection2]
        @trip2.reverse!
      end
      if @start > @intersection1
        @trip = $lines[@start_line][@intersection1..@start]
        @trip.reverse!
      end
      if @end > @intersection2
        @trip2 = $lines[@end_line][@intersection2...@end]
      end
      @journey = @trip.length + @trip2.length
      @trip = @trip.join(', ')
      @trip2 = @trip2.join(',  ')

    end

    erb :mta
  end
end








