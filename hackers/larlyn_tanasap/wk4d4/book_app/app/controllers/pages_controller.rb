class PagesController < ApplicationController
  def index
    @recent_books = Book.order(:release => :desc).limit(5)
    @recent_authors = Book.order(:release => :desc).map {|book| book.author }.compact.uniq.slice(0,5) #=> an array of 5 unique authors
  end

  def search
    search = params[:search]
    @results = []
    unless search == ""
      # Author.column_names[1..-3].each do #the search yadayada
      @results << Author.where("name ILIKE :search", search: "%#{ search }%") # % % means get everything before nd get everything after
      @results << Author.where("nationality ILIKE :search", search: "%#{ search }%") # ILIKE makes it case insensitive
      @results << Book.where("title ILIKE :search", search: "%#{ search }%")
      @results << Book.where("genre ILIKE :search", search: "%#{ search }%")
      @results = @results.flatten.uniq
    end
  end

end