Rails.application.routes.draw do
  get '/' => 'pages#home'
  get '/about' => 'pages#about'
  get '/faq' => 'pages#faq'
  get '/stock' => 'pages#stock'
  get '/movie' => 'pages#movie'
end
