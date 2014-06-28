require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'

get '/movies' do
  @movie_name = params[:movie_name]
    unless @movie_name.nil?
      @movie_name.gsub!(/ /,'+')
      url = "http://omdbapi.com/?t=#{@movie_name}"
      response = HTTParty.get(url)
      @movie = JSON.parse response
    end
  erb :form
end