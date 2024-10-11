class Admin < ApplicationRecord
    has_many :events, class_name: 'Events'
    has_many :questions, class_name: 'Question'
    has_many :reviews, class_name: 'Review'
end
