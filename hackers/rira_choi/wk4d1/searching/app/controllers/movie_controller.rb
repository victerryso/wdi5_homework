class MovieController < ApplicationController
  def search
  end

  def result_list
    @title = params[:title]
    @title.gsub!(/ /,"+")
    url = "http://omdbapi.com/?s=#{ @title }"
    response = HTTParty.get(url)
    @movie = JSON.parse response
  end

  def result
    @imdbid = params[:imdbid]
    url = "http://omdbapi.com/?i=#{ @imdbid }"
    response = HTTParty.get(url)
    @movie = JSON.parse response
    @title = @movie['Title']
    @year = @movie['Year']
    @director = @movie['Director']
    @poster = @movie['Poster']
    @award = @movie['Awards']
    @plot = @movie['Plot']
  end

  def quick_result
    @title = params[:title]
    @title.gsub!(/ /,"+")
    url = "http://omdbapi.com/?t=#{ @title }"
    response = HTTParty.get(url)
    @movie = JSON.parse response # JSON method
    @title = @movie['Title']
    @year = @movie['Year']
    @director = @movie['Director']
    @poster = @movie['Poster']
    @award = @movie['Awards']
    @plot = @movie['Plot']
  end
end