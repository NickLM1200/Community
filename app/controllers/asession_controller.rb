class AsessionController < ApplicationController
  def new
    if session[:username]
    @admin = Admin.find_by(username: session[:username])
      if @admin
        session[:username] = @admin.username
        redirect_to admins_path
      else
        session[:username] = nil
        render :new
      end
    else
      render :new
    end
  end

  def create
    @admin = Admin.find_by(username: params[:username])
    if @admin.present? && @admin.authenticate(params[:password])      
      session[:username] = @admin.username
      redirect_to admins_path, notice: "Welcome back"
    else
      flash[:alert] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session[:username] = nil
    redirect_to adminaccess_path, notice: "Logged out successfully"
  end
end