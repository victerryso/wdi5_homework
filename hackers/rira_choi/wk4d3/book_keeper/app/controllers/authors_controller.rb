class AuthorsController < ApplicationController
  def home
  end

  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def edit
    @author = Author.find params[:id]
  end

  def show
    @author = Author.find params[:id]
  end

  def update
    author = Author.find params[:id]
    author.update author_params

    redirect_to author
  end

  def destroy
    author = Author.find params[:id]
    author.destory

    redirect_to author
  end

  def create
    author = Author.create author_params
    redirect_to author
  end

  private
    def author_params
      params.require(:author).permit(:name, :nationality, :dob, :image)
    end
end