require "pry"
require "pry-debugger"
require "sinatra"
require "sinatra/reloader"
require 'active_record'
require_relative "butterfly"
require_relative "plant"

ActiveRecord::Base.logger = Logger.new(File.open('database.log', 'w'))
ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'butterflies.db'
)

before do
  @families = Butterfly.select('family').uniq
end

after do
  ActiveRecord::Base.connection.close
end

get "/" do
  redirect to "/butterflies"
end

get "/butterflies" do # list of butterflies
  @butterflies = Butterfly.all
  erb :butterflies
end

get "/butterflies/new" do # new butterfly
  erb :new
end

post "/butterflies" do # add new butterfly to db
  Butterfly.create(
    :name => params[:name],
    :image => params[:image],
    :family => params[:family],
    :plant_id => params[:plant_id])
  redirect to "/butterflies"
end

get '/butterflies/family/:family' do
  @butterflies = Butterfly.where(:family => params[:family])
  erb :butterflies
end

get "/butterflies/:id" do # view butterfly
  id = params[:id]
  @butterfly = Butterfly.find id
  erb :view
end

get "/butterflies/:id/edit" do # edit butterfly
  id = params[:id]
  @butterfly = Butterfly.find id
  erb :edit
end

post "/butterflies/:id" do # update butterfly
  butterfly = Butterfly.find params[:id]
  butterfly.name = params[:name]
  butterfly.image = params[:image]
  butterfly.family = params[:family]
  # plant = Plant.find params[:plant_id] # same as code below
  butterfly.plant_id = params[:plant_id]
  butterfly.save
  redirect to "/butterflies/#{butterfly.id}"
end

get "/butterflies/:id/delete" do # delete butterfly
  id = params[:id]
  butterfly = Butterfly.find id
  butterfly.destroy
  redirect to "/butterflies"
end

get "/plants" do # list of plants
  @plants = Plant.all
  erb :plant
end

get "/plants/new" do # new plant
  erb :plant_new
end

post "/plants" do # add new plant to db
  Plant.create :name => params[:name], :image => params[:image]
  redirect to "/plants"
end

get "/plants/:id" do # view plant
  id = params[:id]
  @plant = Plant.find id
  erb :plant_view
end

get "/plants/:id/edit" do # edit plant
  id = params[:id]
  @plant = Plant.find id
  erb :plant_edit
end

post "/plants/:id" do # update plant
  plant = Plant.find params[:id]
  plant.name = params[:name]
  plant.image = params[:image]
  plant.save
  redirect to "/plants/#{plant.id}"
end

get "/plants/:id/delete" do # delete plant
  id = params[:id]
  plant = Plant.find id
  plant.destroy
  redirect to "/plants"
end