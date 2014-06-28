require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'

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
    url = "http://www.omdbapi.com/?i=#{@id}"
    response = HTTParty.get(url)
    @movie = JSON.parse response
    @movie.to_s
    erb :id
  end

  get '/invalid/:title' do
    @title = params[:title]
    erb :invalid
  end






