Rails.application.routes.draw do
  root :to => 'pages#home'# => controller#method

  get '/about' => 'pages#about'
  get '/faq' => 'pages#faq'
  get '/lol' => 'pages#lol'

  get '/dogs' => 'dogs#index' #sends it to the dogs_controller.rb in app/controllers and runs the method called index
  get '/dogs/new' => 'dogs#new'
  get '/dogs/faq' => 'dogs#faq'

  get '/auto/:color/' => 'auto#color'
  get '/auto/:hp/:torque' => 'auto#engine'

  get '/calc/:x/:y/:operator' => 'calc#calculate'
end
