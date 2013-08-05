class SessionsController < ApplicationController
  
  skip_before_filter :verify_logged_in

  #########
  # LOGIN #
  #########  

  # GET   => User login page.
  def new
    @user = User.new
    @disable_nav = true
  end

  # POST  => Login user if found in database.
  def login
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to (user.role == "admin" ? dashboard_path : user), notice: "Logged in!"
    else
      flash[:alert] = "Email or password is invalid."
      redirect_to root_url
    end
  end
  
  ##########
  # SIGNUP #
  ##########  

  # GET   => User sign-up page.
  def signup
    @user = User.new
    @disable_nav = true
  end

  # POST  => Create user with 'student' permissions.
  def create

    @user      = User.new(params[:user])
    @user.role = "student"

    respond_to do |format|
      if @user.save
        UserMailer.signup_confirmation(@user).deliver
        session[:user_id] = @user.id
        format.html { redirect_to @user, notice: "Thanks for signing up!" }
      else
        @disable_nav = true
        format.html { render action: "signup" }
      end
    end

  end

  ##########
  # LOGOUT #
  ##########

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end

end