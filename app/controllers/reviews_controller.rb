class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show edit update destroy]
  before_action :require_login, only: [:create, :new]

  # GET /reviews or /reviews.json
  def index
    @organization = Organization.find(params[:organization_id])
    @reviews = @organization.reviews.where(reviewStatus: true) # Show only approved reviews
  end

  # GET /reviews/1 or /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews or /reviews.json
  def create
    Rails.logger.info "Current user: #{current_user&.inspect}"
    Rails.logger.info "Session: #{session.to_hash}"
  
    if current_user.nil?
      redirect_to login_path, alert: "You must be logged in to submit a review."
      return
    end
  
    @review = Review.new(review_params)
    @review.userID_id = current_user.username
    @review.reviewStatus = true
  
    if @review.save
      redirect_to organization_reviews_path(@review.organizationID_id), notice: "Review submitted successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end
  

  # PATCH/PUT /reviews/1 or /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: "Review was successfully updated." }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1 or /reviews/1.json
  def destroy
    @review.destroy!

    respond_to do |format|
      format.html { redirect_to reviews_path, status: :see_other, notice: "Review was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:starValue, :organizationID_id, :userID_id, :reviewStatus, :comment)
    end
end
