require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'

get '/' do
  "Welcome"
  erb :form
end

get '/result' do
  @title = params[:title]
  @title.gsub!(/ /,"+")
  if @title == "" then
    @title = "Movie not found!"
  end
  url = "http://omdbapi.com/?t=#{ @title }"
  response = HTTParty.get(url)
  @movie = JSON.parse response # JSON method
  #@movie = @title.parse response
  @title = @movie['Title']
  @year = @movie['Year']
  @director = @movie['Director']
  @poster = @movie['Poster']
  @award = @movie['Awards']
  @plot = @movie['Plot']
  erb :result
end

