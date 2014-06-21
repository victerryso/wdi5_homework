require "pry"
require "sinatra"
require "sinatra/reloader"
require "httparty"

get "/" do
    @movie = params[:movie]
    unless @movie.nil?
        url = "http://omdbapi.com/?t=#{ @movie.gsub(/ /, "+") }"
        response = HTTParty.get(url)
        @data = JSON.parse response
        @year = @data["Year"]
        @actors = @data["Actors"]
        @poster = @data["Poster"]
    end
    erb :index
end

