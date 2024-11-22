# app/controllers/survey_responses_controller.rb
class SurveyResponsesController < ApplicationController
  before_action :require_login
    def create
      survey = Survey.find(params[:survey_id])
      params[:responses].each do |question_id, answer_id|
        survey.responses.create(question_id: question_id, answer_id: answer_id)
      end
  
      redirect_to survey_complete_path, notice: "Survey submitted successfully!"
    end
  end  