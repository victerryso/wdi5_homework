Rails.application.routes.draw do
  get '/start' => 'pages#start'
  get '/a'=> 'pages#a'
  get '/b'=> 'pages#b'

  get '/door' => 'pages#door'
  get '/1' => 'pages#one'
  get '/2' => 'pages#two'
  get '/3' => 'pages#three'
end
