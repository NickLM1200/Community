class SurveysController < ApplicationController
  before_action :set_survey, only: %i[ show edit update destroy ]
  before_action :require_login

  def survey
    survey = Survey.create # Create the survey record
  
    if survey.persisted?
      @survey_service = SurveyService.new(survey.id) # Pass the survey ID to the service
    else
      flash[:error] = "Survey could not be created."
      redirect_to some_path and return
    end
  end
  

  # GET /surveys or /surveys.json
  def index
    @surveys = Survey.all
  end

  # GET /surveys/1 or /surveys/1.json
  def show
  end

  # GET /surveys/new
  def new
    @survey = Survey.new
  end

  # GET /surveys/1/edit
  def edit
  end

  # POST /surveys or /surveys.json
  def create
    if logged_in? && params[:responses].present?
      params[:responses].each do |question_id, answer_id|
        Survey.create!(questionID_id: question_id, answer: answer_id, userID_id: current_user.username)
      end
    redirect_to root_path, notice: 'Survey submitted successfully!'
    else
      redirect_to surveys_path, alert: 'Please answer all questions before submitting.'
    end
  end

  # PATCH/PUT /surveys/1 or /surveys/1.json
  def update
    respond_to do |format|
      if @survey.update(survey_params)
        format.html { redirect_to @survey, notice: "Survey was successfully updated." }
        format.json { render :show, status: :ok, location: @survey }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surveys/1 or /surveys/1.json
  def destroy
    @survey.destroy!
    respond_to do |format|
      format.html { redirect_to surveys_path, status: :see_other, notice: "Survey was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  
  private

  def survey_params
    params.require(:survey).permit(:userID_id, :name, :questionID_id, :answer)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_survey
    @survey = Survey.find(params[:id])
    unless @survey
      redirect_to surveys_path, alert: "Survey not found."
    end
  end        
end
