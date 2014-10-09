class StockmovieController < ApplicationController
  def form
  end

  def queryresult
    @query = params[:query]
    #sanitize
    @query = @query.gsub(" ", "+")
    @posters = query_movie(@query)
    @quote = query_stock(@query)
  end

  def movie
    @movie = ""
  end

  def query_movie(query)
    url = "http://www.omdbapi.com/?s=#{query}"
      response = HTTParty.get (url)
      movies = JSON.parse( response )
      unless !movies.include?("Search")
      if movies["Search"].length == 1
        @movie= movies["Search"]
        render :movie
      else
        poster_hash = {}
        movies["Search"].each do |movie|
          movie_title = movie["Title"].gsub(" ","+")
          poster_hash[movie_title] = httparty_query(movie_title)["Poster"]
        end
        return poster_hash
      end
    end
  end

  def query_stock(query)
    symbol = query.upcase!
    begin
      price = YahooFinance::get_quotes(YahooFinance::StandardQuote, symbol)[symbol].lastTrade
    rescue
      return nil
    end
    return price
  end

  def httparty_query(movie_title)
    url = "http://www.omdbapi.com/?t=#{movie_title}"
    url_response = HTTParty.get(url)
    return JSON.parse( url_response )
  end

end