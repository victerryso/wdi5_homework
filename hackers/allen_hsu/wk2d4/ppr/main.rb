require 'pry'
require 'pry-debugger'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'JSON'
require 'sinatra/cookies'

test = "Do you have a test for that?"
pass = "Does the test pass?"
write = "Write a test"
refactor = "Need to refactor?"
make_pass = "Write just enough code for the test to pass"
do_refactor = "Refactor the code"
feature = "Select new feature to implement"

$decision_flow = {
  test => [pass, write],
  pass => [refactor, make_pass],
  write => [pass],
  refactor => [do_refactor,feature],
  make_pass => [pass],
  do_refactor => [pass],
  feature => [test]
}

def encode(message)
  message.gsub(" ", "+")
end

get '/' do
  # get param
  if !params[:prompt]
    @prompt = test
  else
    @prompt = params[:prompt]
  end

  #put out html
  if $decision_flow[@prompt].length < 2
    @links = {"Done" => encode($decision_flow[@prompt][0])}
  else
    @links = {
      "Yes" => encode($decision_flow[@prompt][0]),
      "No" => encode($decision_flow[@prompt][1])
    }
  end
  erb :form
end

