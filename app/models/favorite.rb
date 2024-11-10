class Favorite < ApplicationRecord
  belongs_to :user, foreign_key: 'userID_id', primary_key: 'username', class_name: 'User'
  belongs_to :organization, foreign_key: 'organizationID_id', primary_key: :organizationId, class_name: 'Organization'
end
  