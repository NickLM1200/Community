class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to root_path
    else
      @user = User.new
      render 'users/index'
    end
  end

  def create
    @user = User.find_by(username: params[:user_username])

    if @user.present? && @user.authenticate(params[:password])
      session[:user_username] = @user.username
      redirect_to root_path, notice: "Logged in successfully!"
    else
      flash[:alert] = "Invalid username or password"
      render 'users/index', status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_username] = nil
    redirect_to root_path, notice: "Logged out successfully!"
  end
end
