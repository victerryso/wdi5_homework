Rails.application.routes.draw do
  root :to => 'pages#home'
  get '/home' => 'pages#home'
  get '/about' => 'pages#about'
  get '/faq' => 'pages#faq'

  get '/movies' => 'movies#find'
  get '/movies/search' => 'movies#search'
  get '/movies/display' => 'movies#display'

  get '/stocks' => 'stocks#find'
  get '/stocks/display' => 'stocks#display'
end
