class SessionsController < ApplicationController
  
  def new
    @user = User.new
    @disable_nav = true
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user, notice: "Logged in!"
    else
      flash[:alert] = "Email or password is invalid."
      redirect_to root_url
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end

end
