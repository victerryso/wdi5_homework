require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'json'

get '/' do
  @title = params[:title]
  unless @title == nil
    @title.gsub!(/ /, "+")
    url = "http://omdbapi.com/?t=#{ @title }"
    response = HTTParty.get( url )
    @movie = JSON.parse(response)
    @poster = @movie['Poster']
  end
  erb :form
end