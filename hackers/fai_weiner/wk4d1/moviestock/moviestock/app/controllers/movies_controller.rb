class MoviesController < ApplicationController
  def find
    
  end
  def search
    @title = params[:Title]

    if @title != nil 
      @title.gsub!(/ /, '+')
      url = "http://omdbapi.com/?i=&s=#{ @title }"
      search = HTTParty.get(url)
      @titles_list = JSON.parse(search)
    end
  end
  def display
    @id = params[:id]
    url = "http://omdbapi.com/?i=#{ @id} "
    input = HTTParty.get(url)
    @select_movie = JSON.parse(input)
    @select_title = @select_movie['Title']
    @select_title.gsub!(/ /, '+')
    @select_poster = @select_movie['Poster']
  end
end