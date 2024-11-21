class Survey < ApplicationRecord

    belongs_to :user, foreign_key: :userID_id, primary_key: :username, class_name: 'User', optional: false
    belongs_to :question, foreign_key: :questionID_id, primary_key: :questionID, optional: false
  end
  