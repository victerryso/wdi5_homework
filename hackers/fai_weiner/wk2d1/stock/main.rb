require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'yahoofinance'

get '/fetch' do
  @symbol = params[:symbol]
  if @symbol != nil 
    @price = YahooFinance::get_quotes(YahooFinance::StandardQuote, @symbol)[@symbol].lastTrade
  end

  erb :form
end
