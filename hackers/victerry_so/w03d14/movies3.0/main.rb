require "pry"
require "sinatra"
require "sinatra/reloader"
require "httparty"
require_relative "movie"

after do
    ActiveRecord::Base.connection.close
end

get "/" do # When localhost:4567/ is opened, this opens up with the erb file attached
    @search = params[:search] # The search parameter is given a global variable
    unless @search.nil? # Only does this when a search is given
        url = "http://omdbapi.com/?s=#{ @search.gsub(/ /, "+") }" # Using omdb search
        response = HTTParty.get(url) # Using httparty to get data
        @data = JSON.parse response # Assigning global data with a nice hash
    end
    erb :index # Uses index.erb as the page
end

get "/:id" do # Using imdbID to grab information since gsub looks messy
    @id = params[:id]
    if Movie.exists?(:imdb => @id)
        @data = Movie.where(imdb: @id).first
        @title = @data.title
        @year = @data.year
        @actors = @data.actors
        @poster = @data.poster
    else
        url = "http://omdbapi.com/?i=#{ @id }"
        response = HTTParty.get(url)
        @data = JSON.parse response
        @title = @data["Title"]
        @year = @data["Year"]
        @actors = @data["Actors"]
        @poster = @data["Poster"]
        Movie.create :imdb => @id, :title => @title, :year => @year, :actors => @actors, :poster => @poster
    end
    erb :movie
end

