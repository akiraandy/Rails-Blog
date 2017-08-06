class SessionsController < ApplicationController
  def new
  end

  def create
    user_password = params[:session][:password]
    user_email = params[:session][:email]
    user = user_email.present? && User.find_by(email: user_email)
    if user && user.authenticate(user_password)
      session[:current_user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  def destroy
    session.delete(:current_user_id)
    redirect_to '/login'
  end
end
