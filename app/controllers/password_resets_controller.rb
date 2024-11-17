class PasswordResetsController < ApplicationController
  before_action :get_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new
  end

  def create
    @user = User.find_by(email: params[:email].downcase)
    if @user
      token = @user.initiate_password_reset
      UserMailer.password_reset(@user, token).deliver_now
      flash[:notice] = "Email sent with password reset instructions."
      redirect_to root_url
    else
      flash.now[:alert] = "Email address not found."
      render 'new'
    end
  end

  def edit
  end

  def update
    if params[:user][:password].empty?
      @user.errors.add(:password, "can't be empty")
      render 'edit'
    elsif @user.update(user_params)
      flash[:success] = "Password has been reset."
      redirect_to @user
    else
      Rails.logger.info "Password update failed: #{@user.errors.full_messages}"
      render 'edit'
    end
  end


  private

  # def get_user
  #   @password_reset = PasswordReset.find_by(user_id: params[:user_id])
  #   if @password_reset && BCrypt::Password.new(@password_reset.reset_digest).is_password?(params[:id])
  #     @user = @password_reset.user
  #   else
  #     flash[:alert] = "Invalid password reset link."
  #     redirect_to root_url
  #   end
  # end

  # def get_user
  #   @password_reset = PasswordReset.find_by(user_id: params[:user_id])
  #   if @password_reset && BCrypt::Password.new(@password_reset.reset_digest).is_password?(params[:token])
  #     @user = @password_reset.user
  #   else
  #     flash[:alert] = "Invalid password reset link."
  #     redirect_to root_url
  #   end
  # end
  

  # def get_user
  #   @password_reset = PasswordReset.find_by(user_id: params[:user_id], reset_digest: params[:id])
  #   if @password_reset && BCrypt::Password.new(@password_reset.reset_digest).is_password?(params[:id])
  #     @user = @password_reset.user
  #   else
  #     flash[:alert] = "Invalid password reset link."
  #     redirect_to root_url
  #   end
  # end

  def get_user
    @password_reset = PasswordReset.find_by(user_id: params[:user_id])
    if @password_reset
      if BCrypt::Password.new(@password_reset.reset_digest).is_password?(params[:token])
        @user = @password_reset.user
        Rails.logger.info "Password reset link validated successfully for user: #{@user.username}"
      else
        Rails.logger.info "Token does not match for user_id: #{params[:user_id]}"
        flash[:alert] = "Invalid password reset link."
        redirect_to root_url
      end
    else
      Rails.logger.info "Password reset record not found for user_id: #{params[:user_id]}"
      flash[:alert] = "Invalid password reset link."
      redirect_to root_url
    end
  end
  

  def check_expiration
    if @password_reset.expired?
      flash[:danger] = "Password reset has expired."
      redirect_to new_password_reset_url
    end
  end

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end