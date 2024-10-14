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

    respond_to do |format|
      if @admin.present? && @admin.authenticate(params[:password])      
        session[:username] = @admin.username
        format.html {redirect_to admins_path, notice: "Welcome back"}
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      else
        flash[:alert] = "Invalid email or password"
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    session[:username] = nil

    respond_to do |format|
      format.html { redirect_to adminaccess_path, notice: "Logged out successfully"}
      format.json { head :no_content }
    end
  end
end