class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :verify_logged_in, :except => :login

  private
  def current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end
  
  helper_method :current_user

  def admin?
    current_user.role == "admin"
  end

  def admin_only?
    unless current_user.role == "admin"
      redirect_to user_path(current_user), alert: "Not authorized"
    end
  end
  helper_method :admin_only?

  def current_user?
    current_user.role == "student" || current_user.role == "admin"
  end
  helper_method :current_user?

  def current_user_relationship_only?
    unless current_user.id == Relationship.find(params[:id]).user_id || current_user.admin?
      redirect_to user_path(current_user), alert: "Not authorized"
    end
  end
  helper_method :current_user_relationship_only?

# only works with User Controller views
  def current_user_only?
    unless current_user.id == params[:id].to_i || current_user.admin?
      redirect_to user_path(current_user), alert: "Not authorized"
    end
  end
  helper_method :current_user_only?

# only works with Interview Controller views
  def current_interview_owner_only?
    unless current_user.admin? == true || current_user.id == Interview.find_by_id(params[:id]).user.id.to_i
      redirect_to user_path(current_user), alert: "Not authorized"
    end
  end
  helper_method :current_interview_owner_only?

  def logged_in?
    !current_user.nil?
  end
  helper_method :logged_in?

  def logged_in_only?
    unless current_user.id = true
      redirect_to user_path(current_user), alert: "Not authorized"
    end
  end
  helper_method :logged_in_only?

  def verify_logged_in
    unless logged_in?
      redirect_to root_path, alert: "You must be logged in."
    end
  end
  helper_method :verify_logged_in


  rescue_from CanCan::AccessDenied do |exception|
    redirect_to user_path(current_user), :alert => exception.message
  end
end
