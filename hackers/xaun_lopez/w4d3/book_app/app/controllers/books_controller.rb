class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def create
    book = Book.create (books_params)
    redirect_to (book)
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find params[:id]
  end

  def show
    @book = Book.find params[:id]
  end

  def update
    book = Book.find params[:id]
    book.update (books_params)
      redirect_to (book)
  end

  def destroy
    book = Book.find params[:id]
    book.destroy
    redirect_to (books_path)
  end

  private
  def books_params
    params.require(:book).permit(:title, :released, :genre, :pages, :image, :description, :ISBN, :author_id)
  end

end
