class ConcertsController < ApplicationController
  before_action :signed_in_user
  
  def new
    @concert = Concert.new
  end

  def show
    @my_concerts = current_user.concerts
  end

  def create
    @concert = current_user.concerts.build(concert_params)
    if @concert.save
      redirect_to myconcerts_path
    else
      render 'new'
    end
  end

  def index
    if params[:artist].blank? && params[:location].blank?
      redirect_to new_concert_path
    else
      @concerts = Concert.criteria(params[:artist], params[:location])
    end
  end

  def destroy
    @concert = Concert.find(params[:id])
    @concert.destroy
    redirect_to myconcerts_path, notice: "You have deleted a concert"
  end


  private

  def concert_params
    params.require(:concert).permit(:concert_date, :concert_time, :performing_artists, :venue, :website, :headliner, :location)
  end


  def signed_in_user
    redirect_to signin_path, notice: "Please sign in" unless signed_in?
  end

end 
