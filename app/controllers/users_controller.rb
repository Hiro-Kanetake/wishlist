class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to users_path, alert: "Invalid Access"
    end 
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "Successfully updated your account information!"
    else
        render :edit
    end
  end

  private #this is to ensure params is only called within this controller
  def user_params
    params.require(:user).permit(:username, :name, :email)
  end

end
