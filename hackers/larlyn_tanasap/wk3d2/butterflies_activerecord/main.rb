require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

ActiveRecord::Base.logger = Logger.new(STDERR)

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'butterflies.db'
)

require_relative 'butterfly.rb'
require_relative 'plant.rb'

# binding.pry

before do
  @families = Butterfly.select('family').uniq
end

after do # rails will automatically close the db for us
  ActiveRecord::Base.connection.close
end

get '/' do
  redirect('/butterflies')
end

get '/butterflies' do
  @butterflies = Butterfly.all
  erb :butterflies
end

get '/butterflies/new' do
  erb :new_butterfly
end

post '/butterflies' do
  # butterfly = Butterfly.new
  # butterfly.name = params[:name]
  # butterfly.image = params[:image]
  # butterfly.family = params[:family]
  # butterfly.save
  Butterfly.create(
    :name => params[:name],
    :image => params[:image],
    :family => params[:family],
    :plant_id => params[:plant_id]
    )
  redirect("/butterflies")
end

get '/butterflies/:id' do
  id = params[:id]
  @butterfly = Butterfly.find id
  erb :butterfly
end

get '/butterflies/:id/edit' do
  id = params[:id]
  @butterfly = Butterfly.find id #find will only work on ids and give you only 1
  erb :edit_butterfly
end

post '/butterflies/:id' do
  butterfly = Butterfly.find params[:id]
  butterfly.name = params[:name]
  butterfly.image = params[:image]
  butterfly.family = params[:family]
  butterfly.plant_id = params[:plant_id]
  butterfly.save
  redirect("/butterflies/#{ butterfly.id }")
end

get '/butterflies/:id/delete' do
  butterfly = Butterfly.find params[:id]
  butterfly.destroy # destroys object and accosiations
  redirect("/butterflies")
end

get '/butterflies/family/:family' do
  @butterflies = Butterfly.where :family => params[:family]
  erb :butterflies
end

get '/plants' do
  @plants = Plant.all
  erb :plants
end

get '/plants/new' do
  erb :new_plant
end

post '/plants' do
  # plant = Plant.new
  # plant.name = params[:name]
  # plant.image = params[:image]
  # plant.save
  Plant.create :name => params[:name], :image => params[:image]
  redirect("/plants")
end

get '/plants/:id' do
  id = params[:id]
  @plant = Plant.find id
  erb :plant
end

get '/plants/:id/edit' do
  id = params[:id]
  @plant = Plant.find id #find will only work on ids and give you only 1
  erb :edit_plant
end

post '/plants/:id' do
  plant = Plant.find params[:id]
  plant.name = params[:name]
  plant.image = params[:image]
  plant.save
  redirect("/plants/#{ plant.id }")
end

get '/plants/:id/delete' do
  plant = Plant.find params[:id]
  plant.destroy # destroys object and accosiations
  redirect("/plants")
end
