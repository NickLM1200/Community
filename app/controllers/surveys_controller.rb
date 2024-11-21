class SurveysController < ApplicationController
  before_action :set_survey, only: %i[ show edit update destroy ]

  def survey
    survey = Survey.create # Create the survey record
  
    if survey.persisted?
      @survey_service = SurveyService.new(survey.id) # Pass the survey ID to the service
    else
      flash[:error] = "Survey could not be created."
      redirect_to some_path and return
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
    params[:responses].each do |question_id, answer_id|
      SurveyResponse.create(question_id: question_id, answer_id: answer_id)
    end
    redirect_to success_path, notice: 'Survey submitted successfully!'
  end
end
  
    private
  
    def survey_params
      params.permit(:userID_id, :questionID_id, :answer)
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
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
      unless @survey
        redirect_to surveys_path, alert: "Survey not found."
      end
    end

    # Only allow a list of trusted parameters through.
    private

    def survey_params
      params.require(:survey).permit(:name)
    end
        
end
