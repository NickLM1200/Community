# app/services/survey_service.rb
class SurveyService
  def initialize(survey_id)
    @survey = Survey.find_by(id: survey_id)
    raise ActiveRecord::RecordNotFound, "Survey not found with id #{survey_id}" unless @survey
  end
  
    def conduct_survey
      Question.find_each do |question|
        answers = question.answers # finds related answers via QuestionAnswerRel
        chosen_answer = present_question_to_user(question, answers) # get user's answer
  
        # Save each question-answer response in the Survey table
        @survey.responses.create(question: question, answer: chosen_answer)
      end
    end
  
    private
  
    def present_question_to_user(question, answers)
      # Placeholder logic for user input, typically handled via views.
      answers.first
    end
  end
  