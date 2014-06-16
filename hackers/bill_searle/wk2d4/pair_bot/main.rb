require 'pry'
require 'sinatra'
require 'sinatra/reloader'

# First page
get '/' do
  erb :test_for_that
end
# Do you have a test for that?
get '/test_for_that' do
  choice = params[:choice]
    if choice == "yes"
      erb :does_that_pass
    else
      erb :write_test
    end
end
# Write a test.
get '/write_test' do
  choice = params[:choice]
    if choice == "done"
      erb :does_that_pass
    else
    end
end
# Does that pass?
get '/does_that_pass' do
  choice = params[:choice]
    if choice == "yes"
      erb :need_to_refactor
    else
      erb :enough_code
    end
end
# Need to refactor the code?
get '/need_to_refactor' do
  choice = params[:choice]
    if choice == "yes"
      erb :refactor
    else
      erb :new_feature
    end
end
# Refactor the code
get '/refactor' do
  choice = params[:choice]
    if choice == "done"
      erb :does_that_pass
    else
    end
  end
# Select a feature
get '/new_feature' do
  choice = params[:choice]
    if choice == "done"
      erb :test_for_that
    else
    end
  end

