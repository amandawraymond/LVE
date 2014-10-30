class ArtistsController < ApplicationController
  before_action :signed_in_user
  
  def new
     @artist = Artist.new
  end

  def show
    @my_artists = current_user.artists
    
  end

  def create
    
    @artist = current_user.artists.build(artist_params)
    if @artist.save
      redirect_to myartists_path, notice: "You have created an artist"
    else
      render 'new'
    end
  end

  def index
    if params[:artist].blank?
      redirect_to new_artist_path
    else
      @artist = Artist.artist_info(params[:artist])
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    redirect_to myartists_path, notice: "You have deleted a artist"
  end


  private

  def artist_params
    params.require(:artist).permit(:name, :photo, :similar)
  end

  def signed_in_user
    redirect_to signin_path, notice: "Please sign in" unless signed_in?
  end

end 
