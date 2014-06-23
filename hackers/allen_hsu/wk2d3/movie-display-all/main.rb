require 'pry'
require 'pry-debugger'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'JSON'
require 'sinatra/cookies'
require_relative 'movie'

after do
  ActiveRecord::Base.connection.close
end

enable :sessions
$array =[]

get '/fetch' do
@title = params[:title]
  if @title != nil
    array = @title.split(" ")
    @title = array.join("+")
    if query = Movie.find_by(searchterm: @title)
      @movies = JSON.parse(query.response)
      @source = "From DB"
    else
      url ="http://www.omdbapi.com/?s=#{@title}"
      response = HTTParty.get (url)
      @movies = JSON.parse( response )
      @source = "From OMDB"
      Movie.create(response: response.to_s, searchterm: @title)
    end

    unless !@movies.include?("Search")
      if @movies["Search"].length == 1
        redirect '/poster?title='+@title
      else
        @poster_hash = {}
        @movies["Search"].each do |movie|
          movie_title = movie["Title"].gsub(" ","+")
          poster_url ="http://www.omdbapi.com/?t=#{movie_title}"
          poster_url_response = HTTParty.get (poster_url)
          @poster_hash[movie_title] = JSON.parse( poster_url_response )["Poster"]
        end
      end
    end
  end
  erb :form
end

get '/poster' do
  @title = params[:title]
  if @title != nil
    array = @title.split(" ")
    @title = array.join("+")
    url ="http://www.omdbapi.com/?t=#{@title}"
    response = HTTParty.get (url)
    @movies = JSON.parse( response )
    @poster = @movies["Poster"]
  end
  erb :poster
end
