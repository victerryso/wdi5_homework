require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'sqlite3'

require_relative 'video'

before do
  @genres = Video.select('genre').uniq.pluck(:genre)
end

after do
  ActiveRecord::Base.connection.close
end
get '/' do
  redirect to '/memetube'
end

get '/memetube' do
  @videos = Video.all
  erb :memetube
end

get '/memetube/genre/:genre' do
  @videos = Video.where :genre => params[:genre]
  erb :memetube
end

get '/memetube/new' do
  erb :new_video
end

get '/memetube/:id' do
  id =params[:id]
  @video = Video.find id

  @url_split = @video.id.split(/&|=/)
  @url = @url_split[1]

  erb :video
end

get '/memetube/:id/edit' do
  id = params[:id]
  @video = Video.find id
  erb :edit
end

post '/memetube/:id' do
  id = params[:id]
  video = Video.find id

  video.update_attributes :title => params[:title], :description => params[:description], :url => params[:url], :genre => [:genre]

  redirect to "/memetube/#{video.id}"
end


get '/memetube/:id/delete' do
  id = params[:id]
  video = Video.find id
  video.destroy
  redirect to "/memetube"
end

post '/memetube' do
  Video.create :title => params[:title], :description => params[:description], :url => params[:url], :genre => [:genre]
  redirect to '/memetube'
end
