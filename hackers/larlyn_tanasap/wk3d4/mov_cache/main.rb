require 'pry' if development?
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'json'
require_relative 'movie.rb'

after do
  ActiveRecord::Base.connection.close
end

get '/' do
  @search = params[:search]
  unless @search == nil
    @search.gsub!(/ /, "+")
    url = "http://omdbapi.com/?s=#{ @search }"
    url = URI.encode(url)
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
  @movie = Movie.find_by_imdb_ID params[:id]
  unless @movie
    url = "http://omdbapi.com/?i=#{ params[:id] }"
    response = HTTParty.get( url )
    @movie = JSON.parse(response)
    movie = Movie.new
    movie.title = @movie['Title']
    movie.year = @movie['Year']
    movie.rated = @movie['Rated']
    movie.released = @movie['Release']
    movie.runtime = @movie['Runtime']
    movie.genre = @movie['Genre']
    movie.director = @movie['Director']
    movie.writer = @movie['Writer']
    movie.actors = @movie['Actors']
    movie.plot = @movie['Plot']
    movie.language = @movie['Language']
    movie.country = @movie['Country']
    movie.awards = @movie['Awards']
    movie.poster = @movie['Poster']
    movie.metascore = @movie['Metascore']
    movie.imdb_rating = @movie['imdbRating']
    movie.imdb_ID = @movie['imdbID']
    movie.movie_type = @movie['Type']
    movie.save
    @movie = movie #uses the object from the database. change view to access obj attribs
  end
  erb :movie
end