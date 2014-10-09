require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'


get '/' do

  @search = params[:search]
  unless @search == nil
    @search.gsub!(/ /, '+')
    url = "http://omdbapi.com/?s=#{ @search }"
    response = HTTParty.get(url)
    @result = JSON.parse response
  end
  erb :form
end

get '/movie' do

  @movie_id = params[:id]
  if @movie_id != nil
    @movie_id.gsub!(/ /, '+')
    url = "http://omdbapi.com/?i=#{ @movie_id }"
    response = HTTParty.get(url)
    @movie = JSON.parse response
  end
  erb :movies
end










##############################################

 
# get '/' do
#  @title = params[:title]
#   unless @title.nil?
#       @title.capitalize!
#       url = "http://www.omdbapi.com/?s=#{@title.gsub(/ /,"+")}"
#       response = HTTParty.get(url)
#       @results = JSON.parse response
      

#    end

#    erb :form
# end

# get '/movie' do
#    @title = params[:id]
#     unless @title.nil?
#     @title.captalize!  
#     url = "http://www.omdbapi.com/?i=#{@title.gsub(/ /,"+")}"
#     response = HTTParty.get(url)
#     @movie = JSON.parse response
#     # @actor = @movie['Actors']
#     # @poster = @movie['Poster']
    
#    end
#   erb :movies
# end
























# get '/ti' do

# @title = params[:title]
#     unless @title.nil?
#     @title.captaliz!
#     url = "http://www.omdbapi.com/?i=#{@title.gsub(/ /,"+")}"
#     response = HTTParty.get(url)
#     @movie = JSON.parse response
    
#    end
#   erb :form
# end



#=======================================


# get '/' do
#   @title = params[:title]
#   url = "http://www.omdbapi.com/?t=#{ @title}"
#   response = HTTParty.get(url)
#   @movie = JSON.parse response
#   #@actors = @movie["Actors"]
#   @poster = @movie["Poster"]
#   erb :form
# end

#=========================================
# get '/' do
  
#    @title = params[:title]
#    unless @title.nil?
#    	@title.capitalize!
#       url = "http://www.omdbapi.com/?t=#{@title.gsub(/ /,"+")}"
#       response = HTTParty.get(url)
#       @movie = JSON.parse response
#       @actor = @movie['Actors']
#       @poster = @movie['Poster']

#    end

#    erb :form
# end


#=========================================
# get '/' do
  
#    @title = params[:title]
#    if @title.include?''
#       @title.gsub!(//,'+')
#    url = "http://www.omdbapi.com/?t=#{@title}"
#    response = HTTParty.get(url)
#    @movie = JSON.parse response
#    @actor = @movie['Actors']
#    @poster = @movie['Poster']
#    end

#    erb :form
# end

   
