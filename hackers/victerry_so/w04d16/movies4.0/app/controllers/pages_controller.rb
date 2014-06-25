class PagesController < ApplicationController
  def home
  end

  def about
  end

  def faq
  end

  def stock
    @symbol = params[:stock]
    unless @symbol.nil?
      @symbol.upcase!
      @price = YahooFinance::get_quotes(YahooFinance::StandardQuote, @symbol)[@symbol].lastTrade
    end
  end

  def movie
    @movie = params[:movie]
    unless @movie.nil?
      url = "http://omdbapi.com/?t=#{ @movie.gsub(/ /, "+") }"
      response = HTTParty.get(url)
      @data = JSON.parse response
      @title = @data["Title"]
      @year = @data["Year"]
      @actors = @data["Actors"]
      @poster = @data["Poster"]
    end
  end
end