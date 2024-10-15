module AdminsHelper

  def logged_in?
    !!session[:username]
  end

  def current_user
    @current_user ||= Admin.find_by_id(session[:username]) if !!session[:username]
  end
end
