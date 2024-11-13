class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :admin_logged_in?
=begin
  helper :all
  before_action :authenticate_user!
=end

  before_action :set_current_user

  def current_user
    @current_user ||= User.find_by(username: session[:user_username]) if session[:user_username]
  end

  def logged_in?
    session[:user_username].present?
  end

  def admin_logged_in?
    session[:admin_username].present?
  end

  def require_login
    unless logged_in?
      flash[:alert] = "You must be logged in to access this section."
      redirect_to login_path
    end
  end

  def set_current_user
    @current_user ||= if session[:user_username]
                        User.find_by(username: session[:user_username])
                      elsif session[:admin_username]
                        Admin.find_by(username: session[:admin_username])
                      end    
  end
end
