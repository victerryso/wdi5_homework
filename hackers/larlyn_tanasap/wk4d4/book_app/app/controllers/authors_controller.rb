class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def create
    author = Author.create(author_params)
    redirect_to(author)
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
    author.update(author_params)
    redirect_to(author)
  end

  def destroy
    author = Author.find params[:id]
    author.destroy
    redirect_to(authors_path)
  end

  private
  def author_params
    params.require(:author).permit(:name,:dob,:period,:nationality,:image)
  end

end
#     authors GET    /authors(.:format)          authors#index
#             POST   /authors(.:format)          authors#create
#  new_author GET    /authors/new(.:format)      authors#new
# edit_author GET    /authors/:id/edit(.:format) authors#edit
#      author GET    /authors/:id(.:format)      authors#show
#             PATCH  /authors/:id(.:format)      authors#update
#             PUT    /authors/:id(.:format)      authors#update
#             DELETE /authors/:id(.:format)      authors#destroy