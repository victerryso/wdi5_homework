require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'yahoofinance'

get '/calc' do
	erb :form
end

get '/results' do
	 
   @symbol = params[:symbol].upcase
   @price = YahooFinance::get_quotes(YahooFinance::StandardQuote, @symbol)[@symbol].lastTrade
   erb :calc
   	
  


end
get '/about'do
	erb :about
end


  


