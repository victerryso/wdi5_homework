require 'pry'
require 'pry-debugger'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'JSON'
require 'sinatra/cookies'

enable :sessions
$array =[]
get '/fetch' do
  @title = params[:title]

  if @title != nil
    array = @title.split(" ")
    @title = array.join("+")
    url ="http://www.omdbapi.com/?t=#{@title}"
    response = HTTParty.get (url)
    @movie = JSON.parse( response )
    @poster = @movie["Poster"]
    @oldposter = cookies[:poster]
  end
  binding.pry
  cookies[:poster] ||= []
  cookies[:poster] = @poster
  erb :form
end

