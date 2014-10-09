require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'pry-debugger'
require 'sqlite3'

require_relative 'videos'

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

get '/memetube/new' do
  erb :new_video
end

get '/memetube/:id' do
  id = params[:id]
  @video = Video.find id
  @url_split = @video.url.split(/&|=/)
  @url = @url_split[1]

  erb :video
end

get '/memetube/:id/edit' do
  id = params[:id]
  @video = Video.find id
  
  erb :edit
end

post '/memetube/:id' do
  video = Video.find params[:id]
  video.title = params[:title]
  video.description = params[:description]
  video.url = params[:url]
  video.genre = params[:genre]

  video.save

  redirect to "/memetube/#{ video.id }"
end


get '/memetube/:id/delete' do
  id = params[:id]
  video = Video.find id
  video.destroy

  redirect to "/memetube"

end

post '/memetube' do
  Video.create :title => params[:title], :description => params[:description], :url => params[:url], :genre => params[:genre]
  
  redirect to '/memetube'
end

















