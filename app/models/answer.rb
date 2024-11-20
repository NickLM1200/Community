class Answer < ApplicationRecord
    self.primary_key = 'answerID'
    has_many :question_answer_rels, foreign_key: "answerID", dependent: :destroy
    has_many :questions, through: :question_answer_rels
end
