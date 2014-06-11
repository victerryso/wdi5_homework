require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'


get '/movies' do
  @movie_title = params[:movie_title]
  @movie_title.gsub!(/ /, '+')
  @actors = params[:actors]
  url = "http://omdbapi.com/?t=#{ @movie_title }"
  response = HTTParty.get(url)
  @movie_title = JSON.parse response

  erb :forms
end
