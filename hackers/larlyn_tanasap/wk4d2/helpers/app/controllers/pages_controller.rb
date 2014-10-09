class PagesController < ApplicationController
  def home
  end

  def numbers
    @amount = 234.5465453452
    @large_number = 32435234626
    @phone = 2125552929
  end

  def text
    @numbers = (1..20).to_a
    @person_count = 1
    @people_count = 2
    @story = "In a dark dark town there was a dark dark house in the dark dark house there was a dark dark room"
  end

  def assets
  end

  def url
  end
end