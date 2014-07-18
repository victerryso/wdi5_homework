class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def create
    artist = Artist.create artist_params
    redirect_to( artist )
  end

  def new
    @artist = Artist.new
  end

  def edit
    @artist = Artist.find params[:id]
  end

  def show
    @artist = Artist.find params[:id]
  end

  def update
    artist = Artist.find params[:id]
    artist.update artist_params
    redirect_to( artist )
  end

  def destroy
    artist = Artist.find params[:id]
    artist.destroy
    redirect_to(artists_path)
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :nationality, :dob, :movement, :image)
  end
end

#     artists GET    /artists(.:format)          artists#index
#             POST   /artists(.:format)          artists#create
#  new_artist GET    /artists/new(.:format)      artists#new
# edit_artist GET    /artists/:id/edit(.:format) artists#edit
#      artist GET    /artists/:id(.:format)      artists#show
#             PATCH  /artists/:id(.:format)      artists#update
#             PUT    /artists/:id(.:format)      artists#update
#             DELETE /artists/:id(.:format)      artists#destroy