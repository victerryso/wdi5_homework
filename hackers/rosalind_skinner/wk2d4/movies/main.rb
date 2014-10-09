require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'sqlite3'

require_relative 'movie'


get '/' do
  @title = params[:title]

  unless @title.nil?
    @title.gsub!(/ /,'+')
    url= "http://www.omdbapi.com/?s=#{@title}"
    response = HTTParty.get( url )
    @movie = JSON.parse response

    if @movie['Search'] == nil
      redirect to('/invalid/')+@title

    elsif @movie['Search'].length == 1 && @movie['Response'] != 'False'
      redirect to('/movie/')+@movie['Search'][0]['imdbID']
    end

  end
  erb :movies
end

get '/movie/:id' do
  @id = params[:id]
  imdbid = Movie.find_by imdbid: "#{@id}"

   unless @id.nil?
    url = "http://www.omdbapi.com/?i=#{@id}"
    response = HTTParty.get(url)
    @movie = JSON.parse response
    # @movie.to_s
    redirect to '/'
    unless @movie['Title']
    Movie.create :imdbid => @movie['imdbID'], :Title => @movie['Title'], :Poster => @movie['Poster'], :Year => @movie['Year'], :Actors => @movie['Actors'], :Plot => @movie['Plot']
   end
 end

  erb :id
end

get '/invalid/:title' do
  @title = params[:title]
  erb :invalid
end






