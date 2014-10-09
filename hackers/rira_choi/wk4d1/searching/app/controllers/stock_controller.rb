class StockController < ApplicationController
  def search
  end

  def result
    @symbol = params[:symbol]
    unless @symbol.nil? #
    @symbol.upcase!
    @price = YahooFinance::get_quotes(YahooFinance::StandardQuote, @symbol)[@symbol].lastTrade
    end
  end
end