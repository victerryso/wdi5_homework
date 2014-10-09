Moviestocks::Application.routes.draw do

get '/' => 'pages#start'


get '/movies' => 'pages#movies'

get '/movie' => 'pages#movie'

get '/stocks' => 'pages#stocks'



end
