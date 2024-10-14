class Admin < ApplicationRecord
    has_secure_password

    validates :email, format: {with: Devise.email_regexp, message: "Please use a valid email"}

    has_many :events, class_name: 'Events'
    has_many :questions, class_name: 'Question'
    has_many :reviews, class_name: 'Review'
end
