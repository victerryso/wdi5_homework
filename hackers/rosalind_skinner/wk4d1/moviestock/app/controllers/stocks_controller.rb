class StocksController < ApplicationController

  def index
    @symbol = params[:symbol]

    unless @symbol.nil?
      @symbol.upcase!
      @price = YahooFinance::get_quotes(YahooFinance::StandardQuote, @symbol)[@symbol].lastTrade
      return
    end
    render :index
  end

end