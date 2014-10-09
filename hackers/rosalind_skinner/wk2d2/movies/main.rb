require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'

get '/' do
  @title = params[:title]

  unless @title.nil?
    @title.gsub!(/ /,'+')
    url = "http://www.omdbapi.com/?t=#{@title}"
    response = HTTParty.get( url )
    @movie = JSON.parse response

  end
  erb :movies
end


