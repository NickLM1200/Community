class FavoritesController < ApplicationController
  before_action :set_favorite, only: %i[show edit update destroy]
  before_action :require_login

  # GET /favorites or /favorites.json
  def index
    puts "Current user: #{current_user.username}"
    @favorites = current_user.favorites.includes(:organization)
    #puts "SQL query: #{@favorites.to_sql}"  # Print the generated SQL query for debugging

  end  

  # GET /favorites/1 or /favorites/1.json
  def show
  end

  # GET /favorites/new
  def new
    @favorite = Favorite.new
  end

  # GET /favorites/1/edit
  def edit
  end

  # POST /favorites or /favorites.json
  def create
    @favorite = Favorite.new(favorite_params)
    @favorite.userID_id = current_user.username  # Set the user using the correct field
    
    if @favorite.save
      flash[:notice] = "Organization added to favorites!"
      render json: { flash_notice: flash[:notice], redirect_url: favorites_path, favorite_added: true }
    else
      flash[:alert] = "Unable to add to favorites."
      render json: { flash_notice: flash[:alert], error: 'Unable to add to favorites.' }, status: :unprocessable_entity
    end
    
  end

  # PATCH/PUT /favorites/1 or /favorites/1.json
  def update
    respond_to do |format|
      if @favorite.update(favorite_params)
        format.html { redirect_to @favorite, notice: "Favorite was successfully updated." }
        format.json { render :show, status: :ok, location: @favorite }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorites/1 or /favorites/1.json
  def destroy
    @favorite.destroy!
    
    respond_to do |format|
      format.html { redirect_to favorites_path, status: :see_other, notice: "Favorite was successfully destroyed." }
      format.json { 
        render json: { flash_notice: "Favorite was successfully destroyed.", redirect_url: favorites_path }, status: :ok
      }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_favorite
      @favorite = Favorite.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def favorite_params
      params.require(:favorite).permit(:organizationID_id)
    end
end
