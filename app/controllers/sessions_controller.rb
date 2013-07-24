class SessionsController < ApplicationController
  
  def new
    @user = User.new
    @disable_nav = true
  end

  def login
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

  def signup
    user = User.new
    @disable_nav = true

  end

  def create
    if params[:user][:password] == params[:user][:password_confirmation]
      user = User.new(params[:user])
      user.role = "student"
      user.save
      session[:user_id] = user.id
      redirect_to user, notice: "Thanks for signing up!"
    else
      flash[:alert] = "Email or password is invalid."
      redirect_to signup_path
    end
  end

end