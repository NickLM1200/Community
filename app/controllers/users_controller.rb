class UsersController < ApplicationController
  # Define set_user before skipping
  before_action :set_user, only: %i[show edit update destroy]

  # Skip set_user during logout action
  skip_before_action :set_user, only: [:destroy]

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

  # POST /userlogin - Login action
  def login
    @user = User.find_by(username: params[:username])

    if @user&.authenticate(params[:password])
      session[:user_username] = @user.username
      redirect_to root_path, notice: "Welcome back!"
    else
      flash.now[:alert] = "Invalid username or password"
      render :index, status: :unprocessable_entity  # Render the login form again
    end
  end

  # PATCH/PUT /users/:username - Profile update
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_path(@user), notice: "Profile successfully updated." }
      else
        flash.now[:alert] = @user.errors.full_messages.join(", ")
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end
  

  # DELETE /userlogout - Logout action
  def destroy
    session[:user_username] = nil  # Clear the session variable
    reset_session                  # Clear all session data
    redirect_to root_path, notice: "Successfully logged out."
  end

  private

  # Set the user based on username
  def set_user
    @user = User.find_by(username: params[:username])
    redirect_to users_path, alert: "User not found." if @user.nil?
  end

  # Set the current logged-in user
  def set_current_user
    @current_user = User.find_by(username: session[:user_username]) if session[:user_username]
  end

  # Permit trusted parameters
  def user_params
    # Allow other attributes and conditionally include password fields if provided
    params.require(:user).permit(:username, :first_name, :email, :age_range, :zipcode).tap do |user_params|
      if params[:user][:password].present?
        user_params[:password] = params[:user][:password]
        user_params[:password_confirmation] = params[:user][:password_confirmation]
      end
    end
  end
  
end
