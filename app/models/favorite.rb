class Favorite < ApplicationRecord
    belongs_to :user, foreign_key: 'userID_id', primary_key: :username
    belongs_to :organization, foreign_key: 'organizationID_id', primary_key: :organizationId
  end
  