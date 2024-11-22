class Question < ApplicationRecord
    self.primary_key = 'questionID'
    has_many :surveys, foreign_key: 'questionID_id', dependent: :destroy
    has_many :question_answer_rels, foreign_key: :questionID, dependent: :destroy
    has_many :answers, through: :question_answer_rels
  end
