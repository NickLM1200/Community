class Dependent < ApplicationRecord
    belongs_to :user, foreign_key: 'userID_id', primary_key: 'username', class_name: 'User'
end