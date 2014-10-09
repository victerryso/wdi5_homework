require "pry"
require "sinatra"
require "sinatra/reloader"

$lines = {
  "N" => ["Times Square", "34th", "28th(N)", "23rd(N)", "Union Square", "8th(N)"], # Line N in Hash
  "L" => ["8th(L)", "6th", "Union Square", "3rd", "1st"], # Line L in Hash
  "6" => ["Grand Central", "33rd", "28th(6)", "23rd(6)", "Union Square", "Astor Place"] # Line 6 in Hash
}

get "/" do
  @s_stop = params[:s_stop] # Getting parameters from the form
  @f_stop = params[:f_stop]
  unless @s_stop.nil? # Only displays if a starting stop is chosen
    @s_line = $lines.keys[0] if $lines.values[0].include?@s_stop # Searching to see which line the stop belongs to
    @s_line = $lines.keys[1] if $lines.values[1].include?@s_stop
    @s_line = $lines.keys[2] if $lines.values[2].include?@s_stop
    @f_line = $lines.keys[0] if $lines.values[0].include?@f_stop
    @f_line = $lines.keys[1] if $lines.values[1].include?@f_stop
    @f_line = $lines.keys[2] if $lines.values[2].include?@f_stop
    @s_line = @f_line if @s_stop == "Union Square"
    @f_line = @s_line if @f_stop == "Union Square"

    @s = $lines[@s_line].index(@s_stop) # Index number for Start
    @f = $lines[@f_line].index(@f_stop) # Index number for Finish
    @s_union = $lines[@s_line].index("Union Square") # Index number for Exchange
    @f_union = $lines[@f_line].index("Union Square") # Since Union Square need unique strings for each line, we combine the three strings together

    if @s_line == @f_line # Same Line Condition
      @numstops = (@s - @f).abs # No. Stops in between
      @stoplist = $lines[@s_line][@s..@f] if @s < @f # List of stops in between
      @stoplist = $lines[@s_line][@f..@s].reverse if @s > @f
    else # Different Line Condition
      @numstops = (@s - @s_union).abs + (@f - @f_union).abs # No. Stops in between
      @stoplist = $lines[@s_line][@s..@s_union] if @s <= @s_union # List of stops in between Starting Stop and Union Square
      @stoplist = $lines[@s_line][@s_union..@s].reverse if @s >= @s_union # Needs a reverse so it doesn't look backwards
      @stoplist << "Please Change To Line #{@f_line}"
      @stoplist << $lines[@f_line][@f..@f_union].reverse if @f < @f_union
      @stoplist << $lines[@f_line][@f_union..@f] if @f > @f_union
      @stoplist << $lines[@f_line][@f] if @f == @f_union # If Union Square is chosen, it doubles up
    end
  end
  erb :index
end
