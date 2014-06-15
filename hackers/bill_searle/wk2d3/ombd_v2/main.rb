require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'

get '/movies' do
  @movie_name = params[:movie_name]
    unless @movie_name.nil?
      @movie_name.gsub!(/ /,'+')
      url = "http://omdbapi.com/?s=#{@movie_name}"
      response = HTTParty.get(url)
      @movie = JSON.parse response

        if
          @movie['Search'] == nil
          redirect to('/movie_not_found/')+@movie_name
        end
        if
          @movie['Search'].length == 1
          redirect to('/poster?id=')+@movie['Search'][0]['imdbID']
        end
      end
  erb :form
end

get '/poster' do
  movie_id = params[:id]
    unless movie_id.nil?
      movie_id.gsub!(/ /,'+')
      url = "http://omdbapi.com/?i=#{movie_id}"
      response = HTTParty.get(url)
      @movie = JSON.parse response
    end
  erb :poster
end

get'/movie_not_found/:movie_name' do
  @movie_name = params[:movie_name]
  erb :movie_not_found
end
