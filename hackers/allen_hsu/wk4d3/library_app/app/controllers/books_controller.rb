class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def create
    Book.create(book_params)
    redirect_to books_path
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params["id"])
  end

  def update
    @book = Book.find(params["id"])
    @book.update(book_params)
    redirect_to @book
  end

  def destroy
    @book = Book.find(params["id"])
    @book.destroy
    redirect_to @book
  end

  def show
    @book = Book.find(params["id"])
  end

  private
  def book_params
    params.require(:book).permit(:title, :pages, :isbn, :image, :author_id, :year, :synopsis)
  end

  def self.search(search_term, regex_options)
    options = regex_options == nil ? :title : regex_options[1]
    @book = Book.all.select{|book| book[options].downcase.include? search_term if book[options] != nil}
  end
end