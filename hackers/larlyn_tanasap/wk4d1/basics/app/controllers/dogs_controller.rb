class DogsController < ApplicationController

  def index
    # render :index or render 'index' is the explicit render
  end

  def new
    redirect to('/')
  end

  def faq
    render '/pages/faq'
  end
end