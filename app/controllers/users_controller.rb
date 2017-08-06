class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:current_user_id] = @user.id
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find_by(id: session[:current_user_id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
