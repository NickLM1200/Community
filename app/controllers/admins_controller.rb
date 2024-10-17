class AdminsController < ApplicationController
  before_action :set_admin, only: %i[ show edit update destroy ]
  before_action :set_current_admin

  # GET /admins or /admins.json
  def index
    @admins = Admin.all
  end

  # GET /admins/1 or /admins/1.json
  def show
  end

  # GET /admins/new
  def new
    @admin = Admin.new
  end

  # GET /admins/1/edit
  def edit
  end

  # POST /admins or /admins.json
  def create
    @admin = Admin.new(admin_params)
    respond_to do |format|
      if @admin.save
        format.html { redirect_to @admin, notice: "New admin was successfully created." }
        format.json { render :show, status: :created, location: @admin }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/1 or /admins/1.json
  def update
    respond_to do |format|
      begin
        if @admin.update(admin_params.except(:username))
          format.html { redirect_to @admin, notice: "Admin was successfully updated." }
          format.json { render :show, status: :ok, location: @admin }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @admin.errors, status: :unprocessable_entity }
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

  # DELETE /admins/1 or /admins/1.json
  def destroy
    if session[:username] == @admin.username
      session[:username] = nil
    end
    if @admin.destroy
      respond_to do |format|
        format.html { redirect_to admins_path, status: :see_other, notice: "Admin was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to admins_path, alert: @admin.errors.full_messages.join(", ") }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:username])
    end

    # Only allow a list of trusted parameters through.
    def admin_params
      params.require(:admin).permit(:username, :email, :firstName, :password, :password_confirmation)
    end
end
