require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'

get  '/' do 
		@title = params[:title].to_s.upcase
    	url = "http://omdbapi.com/?t=#{ @title.gsub(' ','+') }"
		response = HTTParty.get(url)

		@movie = JSON.parse response
		@plot = @movie['Plot']
		@actors = @movie['Actors']
		@poster= @movie['Poster']
		@year = @movie['Year']
		@rated = @movie['Rated']

erb :form
end
