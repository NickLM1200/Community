class Question < ApplicationRecord
    has_many :surveys, foreign_key: :questionID_id, dependent: :destroy
  end
  