class ArtistsController < ApplicationController
  before_action :signed_in_user
  def new
     @artist = Artist.new
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def create
    @artist = current_user.artists.build(artist_params)
    if @artist.save
      redirect_to artist_path(@artist.id)
      render 'new'
    else
      render 
    end
  end

  def index
    @artist = current_user.artists
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    redirect_to artists_path, notice: "You have deleted a artist"
  end


  private

  def artist_params
    params.require(:artist).permit(:name, :photo, :similar)
  end

  def signed_in_user
    redirect_to signin_path, notice: "Please sign in" unless signed_in?
  end

end 
