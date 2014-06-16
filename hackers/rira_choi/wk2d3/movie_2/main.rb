require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'

get '/' do
  "Movie"
  erb :form
end

get '/result_1' do
  @title = params[:title]
  @title.gsub!(/ /,"+")
  # @id = params[:imdbID]
  url = "http://omdbapi.com/?s=#{ @title }"
  response = HTTParty.get(url)
  @movie = JSON.parse response # JSON method: making them for ruby to read(hash, array..)

  # # Tested movie hash for length of 1 i.e. single movie and go fetch data if single movie and display result
  # if @movie["Search"].length == 1 then
  #    @id = @movie["Search"]["imdbID"]
  #    url = "http://omdbapi.com/?t=#{ @title }"
  #    response = HTTParty.get(url)
  #    @smovie = JSON.parse response # JSON method
  #    @title = @movie['Title']
  #    @id = @movie['imdbID']
  #    @year = @movie['Year']
  #    @director = @movie['Director']
  #    @poster = @movie['Poster']
  #    @award = @movie['Awards']
  #    @plot = @smovie['Plot']
  #    erb :result
  # else
    erb :result_1
  # end
end

get '/movielist' do
  @imdbid = params[:imdbid]
  #@title.gsub!(/ /,"+")
  url = "http://omdbapi.com/?i=#{ @imdbid }"
  response = HTTParty.get(url)
  @searched_movie = JSON.parse response
  @title = @searched_movie['Title']
  @year = @searched_movie['Year']
  @director = @searched_movie['Director']
  @poster = @searched_movie['Poster']
  @award = @searched_movie['Awards']
  @plot = @searched_movie['Plot']
  erb :movielist
end


get '/result' do
  @title = params[:title]
  @title.gsub!(/ /,"+")
  url = "http://omdbapi.com/?t=#{ @title }"
  response = HTTParty.get(url)
  @movie = JSON.parse response # JSON method
  @title = @movie['Title']
  @id = @movie['imdbID']
  @year = @movie['Year']
  @director = @movie['Director']
  @poster = @movie['Poster']
  @award = @movie['Awards']
  @plot = @movie['Plot']

  erb :result

end

