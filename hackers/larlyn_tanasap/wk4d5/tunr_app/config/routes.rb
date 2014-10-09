Rails.application.routes.draw do
  root :to => "pages#hamldemo"
  # get '/haml' => 'pages#hamldemo'
  resources :users
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
