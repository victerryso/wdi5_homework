class MoviesController < ApplicationController

  def index

    unless params[:title].nil?
      @title = params[:title]
      @title.gsub!(/ /,'+')
      url= "http://www.omdbapi.com/?s=#{@title}"
      response = HTTParty.get( url )
      @movies = JSON.parse response

      if @movies['Search'] == nil
        redirect_to('/invalid/')+@title
        return

      elsif @movies['Search'].length == 1 && @movies['Response'] != 'False'
        redirect_to(('/movies/')+@movies['Search'][0]['imdbID'])
        return
      end
    end
    render :index
  end

  def lookup
      @title = params[:title]
      @title.gsub!(/ /,'+')
      url= "http://www.omdbapi.com/?s=#{@title}"
      response = HTTParty.get( url )
      @movies = JSON.parse response

      if @movies['Search'] == nil
        redirect_to ('/invalid/')+@title
        return

      elsif @movies['Search'].length == 1 && @movies['Response'] != 'False'
        redirect_to('/movies/'+@movies['Search'][0]['imdbID'])
        return
      end

    render :lookup

  end

  def id
    @id = params[:id]
    url = "http://www.omdbapi.com/?i=#{@id}"
    response = HTTParty.get(url)
    @movies = JSON.parse response
    @movies.to_s
    render :id
  end

  def invalid
    @title = params[:title]

    render :invalid
  end

end