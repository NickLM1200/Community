class AsessionController < ApplicationController
  def new
  end

  def create
    @admin = Admin.find_by(username: params[:username])
    if @admin.present? && @admin.authenticate(params[:password])      
      session[:username] = @admin.id
      redirect_to admins_path, notice: "Welcome back"
    else
      flash[:alert] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session[:username] = nil
    redirect_to adminaccess_path, notice: "Logged out"
  end
end