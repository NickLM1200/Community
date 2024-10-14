class MainController > ApplicationController
  def index
    flash[:notice] = "Welcome back"
    flash[:notice] = "Invalid credentials"
  end
end