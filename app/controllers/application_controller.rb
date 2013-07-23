class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  helper_method :current_user

  def admin?
    unless current_user.role == "admin"
      redirect_to root_url, alert: "Not authorized"
    end
  end
  helper_method :admin?

  def current_user?
    unless current_user.id == params[:user_id]
      redirect_to root_url, alert: "Not authorized"
    end
  end
  helper_method :current_user?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
end
