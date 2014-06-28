Rails.application.routes.draw do
 root :to => 'pages#home'
 get '/numbers_are_amazing' => 'pages#numbers', :as => :numbers # sets the variable to numbers
 get '/text' => 'pages#text'
 get '/assets_demo' => 'pages#assets'
 get '/url' => 'pages#url'
end
