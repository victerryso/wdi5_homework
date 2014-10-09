require 'sqlite3'
require 'sinatra'
require 'sinatra/reloader'
require_relative 'videos.rb'

before do
    @genres = Video.select('genre').uniq
end

after do # rails will automatically close the db for us
  ActiveRecord::Base.connection.close
end

get '/' do
  redirect("/videos")
end

get '/videos' do
  @videos = Video.all
  erb :videos
end

post '/videos' do
  Video.create :title => params[:title], :description => params[:description], :url => params[:url], :genre => params[:genre]
  redirect("/videos")
end

get '/videos/genres/:genre' do
  @videos = Video.where :genre => params[:genre]
  erb :video_by_genre
end

get '/videos/:id' do
  @video = Video.find params[:id]
  erb :video
end

get '/videos/:id/edit' do
  @video = Video.find params[:id]
  erb :edit_video
end

post '/videos/:id' do
  video = Video.find params[:id]
  video.title = params[:title]
  video.description = params[:description]
  video.url = params[:url]
  video.genre = params[:genre]
  video.save
  redirect("/videos/#{ params[:id] }")
end

get '/videos/:id/delete' do
  video = Video.find params[:id]
  video.destroy
  redirect("/videos")
end