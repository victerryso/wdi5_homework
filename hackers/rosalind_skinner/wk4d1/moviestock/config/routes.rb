Rails.application.routes.draw do

  get '/' => 'pages#index'
  get '/about' => 'pages#about'
  get '/faq' => 'pages#faq'

  get '/movies' => 'movies#index'
  get '/lookup' => 'movies#lookup'
  get '/invalid/:title' => 'movies#invalid'
  get '/movies/:id' => 'movies#id'

  get '/stocks' => 'stocks#index'

end
