class UsersController < ApplicationController
  # Define set_user before skipping
  before_action :set_user, only: %i[show edit update destroy]

  # Callbacks for other actions
  before_action :set_current_user, only: %i[show edit update destroy]

  # GET /users or /users.json
  def index
    @user = User.new  # Initialize a new user for the login form
  end

  # GET /users/new
  def new
    @user = User.new
  end

  def edit
    # @user is set by the before_action
  end

  # POST /users - Profile creation
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_username] = @user.username
        format.html { redirect_to root_path, notice: "Profile successfully created!" }
      else
        flash.now[:alert] = @user.errors.full_messages.join(", ")
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/:username - Profile update
  def update
    respond_to do |format|
      if @user.update(user_params)
        @user.update_references
        format.html { redirect_to user_path(@user), notice: "Profile successfully updated." }
      else
        flash.now[:alert] = @user.errors.full_messages.join(", ")
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end
  

  # DELETE  - User delete action
  def destroy
    if session[:user_username] == @user.username
      session[:user_username] = nil
    end
    if @user.destroy
      respond_to do |format|
        format.html { redirect_to root_path, status: :see_other, notice: "User was successfully deleted." }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path, alert: @user.errors.full_messages.join(", ") }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Set the user based on username
  def set_user
    @user = User.find_by(username: params[:username])
    redirect_to users_path, alert: "User not found." if @user.nil?
  end

  # Permit trusted parameters
  def user_params
    # Allow other attributes and conditionally include password fields if provided
    params.require(:user).permit(:username, :first_name, :email, :age_range, :zipcode, :password, :password_confirmation).tap do |user_params|
      if params[:user][:password].present?
        user_params[:password] = params[:user][:password]
        user_params[:password_confirmation] = params[:user][:password_confirmation]
      end
    end
  end
  
end
