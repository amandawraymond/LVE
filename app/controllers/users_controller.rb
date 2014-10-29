class UsersController < ApplicationController
  before_action :signed_in_user, only:[:show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  def new
     @user = User.new
  end

  def create
    @user =  User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to LVE! Start saving concerts to your profile!"
      sign_in @user
      redirect_back_or user_path(@user.id)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signed_in, notice: "Please sign in"
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end
