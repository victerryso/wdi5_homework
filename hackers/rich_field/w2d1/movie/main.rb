require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'

get '/' do
  @title = params[:title]
  url = "http://www.omdbapi.com/?t=#{ @title}"
  response = HTTParty.get(url)
  @movie = JSON.parse response
  @actors = @movie["Actors"]
  @poster = @movie["Poster"]
  erb :form
end