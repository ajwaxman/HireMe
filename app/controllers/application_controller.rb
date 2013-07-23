class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  helper_method :current_user

  def admin?
    current_user.role == "admin"
  end

  def admin_only?
    unless current_user.role == "admin"
      redirect_to root_url, alert: "Not authorized"
    end
  end
  helper_method :admin_only?

  def current_user?
    current_user.role == "student" || current_user.role == "admin"
  end
  helper_method :current_user?

  def current_user_only?
    unless current_user.id == params[:id].to_i || current_user.admin?
      redirect_to root_url, alert: "Not authorized"
    end
  end
  helper_method :current_user_only?


  def logged_in?
    unless current_user.id = true
      redirect_to root_url, alert: "Not authorized"
    end
  end
  helper_method :logged_in?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
end
