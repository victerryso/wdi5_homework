class PagesController < ApplicationController
    
    def start
    end

	def movies
		  @search = params[:search]
		  unless @search == nil
		    @search.gsub!(/ /, '+')
		    url = "http://omdbapi.com/?s=#{ @search }"
		    response = HTTParty.get(url)
		    @result = JSON.parse response
		  end

    end

	def movie
		@movie_id = params[:id]
		  if @movie_id != nil
		    @movie_id.gsub!(/ /, '+')
		    url = "http://omdbapi.com/?i=#{ @movie_id }"
		    response = HTTParty.get(url)
		    @movie = JSON.parse response
		end
	end

	def stocks
		@symbol = params[:symbol]
		if @symbol.present?
		  @symbol = params[:symbol].upcase
          @price = YahooFinance::get_quotes(YahooFinance::StandardQuote, @symbol)[@symbol].lastTrade
     	else
     	  @symbol = ''
     	  @price = ''
     	end
	end

	def update
	end

	def faq
	end
end