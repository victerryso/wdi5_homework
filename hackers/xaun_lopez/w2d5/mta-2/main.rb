require 'pry'
require 'pry-debugger'
require 'sinatra'
require 'sinatra/reloader'

$lines = {
    :n => ['Times Square', '34th','28th', '23rd', 'Union Square', '8th'],
    :l => ['8th', '6th', 'Union Square', '3rd', '1st'],
    :'6' => ['Grand Central', '33rd', '28th', '23rd', 'Union Square', 'Astor Place']
  }

get '/' do

  erb :start
end


get '/journey' do

  @start_station, @start_line = params[:start_station].split(' : ')
  @stop_station, @stop_line = params[:stop_station].split(' : ')

  @start_station_index = $lines[@start_line.downcase.to_sym].index (@start_station)

  @stop_station_index = $lines[@stop_line.downcase.to_sym].index (@stop_station)

  @intersection1 = $lines[@start_line.downcase.intern].index 'Union Square'
  @intersection2 = $lines[@stop_line.downcase.intern].index 'Union Square'

  if @start_line == @stop_line && @start_station_index < @stop_station_index
    @trip = $lines[@start_line.downcase.intern][@start_station_index..@stop_station_index]
    @trip = @trip.length - 1
  else
    @trip = $lines[@start_line.downcase.intern][@stop_station_index..@start_station_index]
    @trip = @trip.length - 1
  end


  if @start_line != @stop_line
    if @start_station_index < @intersection1 && @stop_station_index > @intersection2
      @trip1 = $lines[@start_line.downcase.intern][@start_station_index..@intersection1]
      @trip2 = $lines[@stop_line.downcase.intern][@intersection2..@stop_station_index]
      @trip = @trip1.length + @trip2.length - 2
    end

    if @start_station_index < @intersection1 && @stop_station_index < @intersection2
      @trip1 = $lines[@start_line.downcase.intern][@start_station_index..@intersection1]
      @trip2 = $lines[@stop_line.downcase.intern][@stop_station_index..@intersection2]
      @trip2.reverse!
      @trip = @trip1.length + @trip2.length - 2
    end

    if @start_station_index > @intersection1 && @stop_station_index > @intersection2
      @trip1 = $lines[@start_line.downcase.intern][@intersection1..@start_station_index]
      @trip2 = $lines[@stop_line.downcase.intern][@intersection2..@stop_station_index]
      @trip = @trip1.length + @trip2.length - 2
    end

    if @start_station_index > @intersection1 && @stop_station_index < @intersection2
      @trip1 = $lines[@start_line.downcase.intern][@intersection1..@start_station_index]
      @trip2 = $lines[@stop_line.downcase.intern][@stop_station_index..@intersection2]
      @trip = @trip1.length + @trip2.length - 2
    end

    if @start_station_index == @intersection1 && @stop_station_index == @intersection2
      @trip = 0
    end
  end

  erb :start
end









