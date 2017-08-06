class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to "/login"
  end

  def show

  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
