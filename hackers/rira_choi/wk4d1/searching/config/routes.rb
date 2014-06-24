Rails.application.routes.draw do
  root :to => 'pages#home'
  get '/about' => 'pages#about'
  get '/faq' => 'pages#faq'

  get '/movie/search' => 'movie#search'
  get '/movie/result_list' => 'movie#result_list'
  get '/movie/result' => 'movie#result'
  get '/movie/quick_result' =>'movie#quick_result'

  get '/stock/search' => 'stock#search'
  get '/stock/result' => 'stock#result'


end
