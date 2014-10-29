class ConcertsController < ApplicationController
  before_action :signed_in_user
  
  def new
     @concert = Concert.new
  end

  def show
    @concert = Concert.find(params[:id])
  end

  def create
    @concert = current_user.concerts.build(concert_params)
    if @concert.save
      redirect_to concert_path(@concert.id)
    else
      render 'new'
    end
  end

  def index
    @concerts = current_user.concerts
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
