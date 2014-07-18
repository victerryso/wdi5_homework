require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'json'

get '/' do
  @search = params[:search]
  unless @search == nil
    @search.gsub!(/ /, "+")
    url = "http://omdbapi.com/?s=#{ @search }"
    response = HTTParty.get( url )
    @results = JSON.parse(response)
      if @results['Search'] != nil && @results['Search'].length == 1
        @movie_id = @results['Search'][0]['imdbID']
        redirect to("/movie?id=#{@movie_id}")
      end
  end
  erb :search
end

get '/movie' do
  @movie_id = params[:id]
  url = "http://omdbapi.com/?i=#{ @movie_id }"
  response = HTTParty.get( url )
  @movie = JSON.parse(response)
  erb :movie
end