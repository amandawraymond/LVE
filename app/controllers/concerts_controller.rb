class ConcertsController < ApplicationController
  before_action :signed_in_user
  
  def new
     @concert = Concert.new

  end

  def show
    # @concerts_of_location = Concert.location(params[:location])
    # @concerts_of_artists = Concert.performing_artists(params[:performing_artists])
    #@list_of_both = @concert_of_location["artists"]["artist"].include?[:performing_artists]
  end

  def create
    # @my_concerts = current_user.concerts.find(concert_params[:concert_id])
    @concert = @my_concerts.concerts.build(concert_params)
    #@concert = current_user.concerts.build(concert_params)
    if @concert.save
      redirect_to concert_path(@concert.id)
    else
      render 'new'
    end
  end

  def index
    # @concerts_of_location = Concert.location(params[:location])
    # @concerts_of_artists = Concert.artist(params[:artist])
    @concert_list = Concert.criteria(params[:location], params[:artist])
  end

  def destroy
    @concert = Concert.find(params[:id])
    @concert.destroy
    redirect_to concerts_path, notice: "You have deleted a concert"
  end


  private

  def concert_params
    params.require(:concert).permit(:concert_date, :concert_time, :performing_artists, :venue, :website)
  end


  def signed_in_user
    redirect_to signin_path, notice: "Please sign in" unless signed_in?
  end

end 
