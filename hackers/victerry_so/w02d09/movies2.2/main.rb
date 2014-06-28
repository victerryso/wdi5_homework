require "pry"
require "sinatra"
require "sinatra/reloader"
require "httparty"

get "/" do # When localhost:4567/ is opened, this opens up with the erb file attached
    @search = params[:search] # The search parameter is given a global variable
    unless @search.nil? # Only does this when a search is given
        url = "http://omdbapi.com/?s=#{ @search.gsub(/ /, "+") }" # Using omdb search
        response = HTTParty.get(url) # Using httparty to get data
        @data = JSON.parse response # Assigning global data with a nice hash
    end
    erb :index # Uses index.erb as the page
end

get "/movie/:id" do # Using imdbID to grab information since gsub looks messy
    @id = params[:id]
    unless @id.nil?
        url = "http://omdbapi.com/?i=#{ @id }"
        response = HTTParty.get(url)
        @data = JSON.parse response
        @year = @data["Year"]
        @actors = @data["Actors"]
        @poster = @data["Poster"]
    end
    erb :movie
end

