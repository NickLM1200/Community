class ApplicationController < ActionController::Base
  def set_current_admin
    if session[:username]
      Current.admin = Admin.find_by(username: session[:username])
    else
      redirect_to adminaccess_path
    end
  end
end
