require 'pry'
require 'pry-debugger'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'json'

@counts = 0

get '/fetch' do
  @title = params[:Title]

  if @title != nil 
    @title.gsub!(/ /, '+')
    url = "http://omdbapi.com/?i=&s=#{ @title }"
    search = HTTParty.get(url)
    @titles_list = JSON.parse(search)
    @titles_list["Search"].each do |movie| 
      @id = movie['imdbID']
      url = "http://omdbapi.com/?i=#{ @id} "
      details = HTTParty.get(url)
      @movie_details_full = {}
      @movie_details_full = JSON.parse(details)
      movie.merge!(@movie_details_full) { |key, value| value}
      movie.delete_if do |movie| 
        movie['Type'] != "movie" || movie['Rating'] == "N/A"
      end
    end

    @counts = @titles_list["Search"].length

    if @counts == 1
      #@titles_array.collect { }
      @id = @titles_list["Search"][0]['imdbID']
      redirect to ("/display?id=#{ @id }")
    else

      # @movie_array = @titles_list["Search"].flatten
      # @movie_array.select do |att|
      #   params[:id] = att["imdbID"]
      # end

    end


  end
  erb :movie_list
end

get '/display' do
  @id = params[:id]
  url = "http://omdbapi.com/?i=#{ @id} "
  input = HTTParty.get(url)
  @select_movie = JSON.parse(input)
  @select_poster = @select_movie['Poster']

  erb :display
end
