module Administrator
  class UsersController < Administrator::BaseController
    before_action :set_user, only: %i[show edit update destroy]
    before_action :set_current_admin

    # GET /users or /users.json
    def index
      @users = User.all
    end

    def show
    end

    # GET /users/new
    def new
      @user = User.new
    end

    def edit
    end

    # POST /users - Profile creation
    def create
      @user = User.new(user_params)
      respond_to do |format|
        if @user.save
          format.html { redirect_to administrator_users_path, notice: "New user was successfully created." }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /users/:username - Profile update
    def update
      respond_to do |format|
        begin
          if @user.update(user_params.except(:username))
            format.html { redirect_to administrator_users_path, notice: "User successfully updated." }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        rescue ActiveRecord::ReadOnlyRecord => e
          if e.message.include?("username cannot be changed once set")
            format.html { render :edit, alert: "The username cannot be changed once set." }
            format.json { render json: { error: "The username cannot be changed once set." }, status: :unprocessable_entity }
          else
            format.html { render :edit, alert: e.message }
            format.json { render json: { error: e.message }, status: :unprocessable_entity }
          end
        end
      end
    end

    # DELETE /logout - Logout action
    def destroy
      if @user.destroy
        respond_to do |format|
          format.html { redirect_to administrator_users_path, status: :see_other, notice: "User was successfully deleted." }
          format.json { head :no_content }
        end
      else
        respond_to do |format|
          format.html { redirect_to admindashboard_path, alert: @user.errors.full_messages.join(", ") }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

    private

    # Set the user based on username
    def set_user
      @user = User.find(params[:id])
    end

    # Permit trusted parameters
    def user_params
      params.require(:user).permit(:username, :email, :first_name, :age_range, :password, :password_confirmation, :zipcode)
    end
  end
end