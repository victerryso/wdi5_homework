require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require_relative 'story'

after do
  ActiveRecord::Base.connection.close
end

get '/' do # view
  @story = Story.all
  erb :index
end

post '/' do # add blog
  Story.create(:name => params[:name], :blog => params[:blog])
  redirect to "/"
end

get "/:id" do # edit
  @story = Story.find params[:id]
  erb :edit
end

post "/:id" do # update
  story = Story.find params[:id]
  story.name = params[:name]
  story.blog = params[:blog]
  story.save
  redirect to "/"
end

get "/:id/delete" do # delete
  story = Story.find params[:id]
  story.destroy
  redirect to "/"
end