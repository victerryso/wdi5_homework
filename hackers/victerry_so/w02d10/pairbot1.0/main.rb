require "pry"
require "sinatra"
require "sinatra/reloader"



get "/" do
  erb :index
end

get "/nay" do
  erb :nay
end

get "/yay" do
  erb :yay
end

get "/yayyay" do
  erb :index
end