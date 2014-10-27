class UsersController < ApplicationController
  def new
     @user = User.new
  end

  def create
    @user =  User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to LVE! Start saving concerts to your profile!"
      # sign_in @user
      # redirect_back_or user_path(@user.id)
      redirect_to @user
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
end
