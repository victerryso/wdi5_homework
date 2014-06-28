class PagesController < ApplicationController
  def start
    @symbol = params[:symbol]
    unless @symbol == nil || @symbol == ""
      @symbol.upcase!
      @last_trade = YahooFinance::get_quotes(YahooFinance::StandardQuote, @symbol)[@symbol].lastTrade
    end
    @title = params[:title]
    unless @title == nil || @title == ""
      @title.gsub!(/ /, "+")
      url = "http://omdbapi.com/?t=#{ @title }"
      response = HTTParty.get( url )
      @movie = JSON.parse(response)
    end
  end

  def about
  end

  def faq
  end

end