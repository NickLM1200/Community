class QuestionAnswerRel < ApplicationRecord
  belongs_to :question, foreign_key: "questionID"
  belongs_to :answer, foreign_key: "answerID"
end
