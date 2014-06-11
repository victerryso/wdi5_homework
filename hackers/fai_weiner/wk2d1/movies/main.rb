require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'json'

get '/fetch' do
  @title = params[:Title]
  if @title != nil 
    @title.gsub!(/ /, '+')
    url = "http://omdbapi.com/?t=#{ @title }"
    response = HTTParty.get(url)
    @movie = JSON.parse (response)
    @poster = @movie['Poster']
  end

  erb :form
end
