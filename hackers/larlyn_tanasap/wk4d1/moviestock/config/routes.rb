Rails.application.routes.draw do
  root :to => 'pages#start'
  get '/faq' => 'pages#faq'
  get '/about' => 'pages#about'
end