class StocksController < ApplicationController
  def find
  end
  def display
    @symbol = params[:symbol]
    if @symbol != nil 
      @symbol.upcase!
      @price = YahooFinance::get_quotes(YahooFinance::StandardQuote, @symbol)[@symbol].lastTrade
    end
  end
end