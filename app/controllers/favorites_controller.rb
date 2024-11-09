class FavoritesController < ApplicationController
  before_action :set_favorite, only: %i[show edit update destroy]
  before_action :require_login

  # GET /favorites or /favorites.json
  def index
    puts "Current user: #{current_user.username}"
    @favorites = current_user.favorites.includes(:organization).where("favorites.userID_id = ?", current_user.username)
    puts "SQL query: #{@favorites.to_sql}"  # Print the generated SQL query for debugging

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
      # Render a JS response to display a pop-up notification with a link to view favorites
      render js: "alert('Organization added to favorites! Click OK to view your favorites.'); window.location = '#{favorites_path}'"
    else
      flash[:alert] = "Unable to add to favorites."
      render js: "alert('Unable to add to favorites.');" # Show error via JS
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
      format.json { head :no_content }
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
