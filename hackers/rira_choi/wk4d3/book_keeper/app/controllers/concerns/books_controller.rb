class BooksController < ApplicationController
  def index

  end

  def new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  def create
  end

  private
    def book_params
      params.require(:book).permit(:title, :year, :genre, :description, :image)
    end
end