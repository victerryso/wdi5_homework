require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'sqlite3'

require_relative 'place'

before do
  @categories = Place.select('category')
end

after do
  ActiveRecord::Base.connection.close
end

get '/' do
  redirect to '/eaters'
end

get '/eaters' do
  @places = Place.all
  erb :eaters
end

get '/eaters/category/:category' do
  @places = Place.where :category => params[:category]
  erb :eaters
end

get '/eaters/rating/:rating' do
  @places = Place.where :rating => params[:rating]
  erb :eaters
end

get '/eaters/new' do
  erb :new_eat
end

get '/eaters/:id' do
  id =params[:id]
  @place = Place.find id
  @places_all = Place.all
  erb :eat
end

get '/eaters/:id/edit' do
  id = params[:id]
  @place = Place.find id
  erb :edit_eat
end

post '/eaters/:id' do
  id = params[:id]
  place = Place.find id

  place.update_attributes :name => params[:name], :phone => params[:phone], :url => params[:url], :category => params[:category], :rating => params[:rating], :review => params[:review], :image => params[:image], :area => params[:area]

  redirect to "/eaters/#{place.id}"
end


get '/eaters/:id/delete' do
  id = params[:id]
  place = Place.find id
  place.destroy
  redirect to "/eaters"
end

post '/eaters' do
  Place.create :name => params[:name], :phone => params[:phone], :url => params[:url], :category => params[:category], :rating => params[:rating], :review => params[:review], :image => params[:image], :area => params[:area]
  redirect to '/eaters/#{place.id}'
end
