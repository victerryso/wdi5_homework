require_relative 'books_controller'
require_relative 'authors_controller'

class SearchController < ApplicationController
  def results
    query = params['query'].downcase
    regex_options = query.match(/\b([a-z]*):(.*)/)
    options = regex_options[1].to_s if regex_options != nil
    search_term = regex_options != nil ? regex_options[2] : query
    @authors = AuthorsController.search(search_term, regex_options) if test_attributes(Author, options)
    @books = BooksController.search(search_term,regex_options) if test_attributes(Book, options)
  end

  private

  def test_attributes(object, parameter)
    unless parameter == nil
      return object.attribute_names.include? parameter
    else
      return true
    end
  end

end