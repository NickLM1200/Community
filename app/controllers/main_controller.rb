class MainController > ApplicationController
  def index
    if session[:user_username]
      @user = User.find_by(username: session[:user_username])
      if @user
        Current.user = @user
      else
        reset_session
      end
    end
  end
end