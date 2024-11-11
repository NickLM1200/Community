class Category < ApplicationRecord

    before_save :uppercase_abbv, if: :new_record?
    before_save :titleize_cat_name

    validates :abbv, presence: true, uniqueness: { case_sensitive: false }

    has_many :classifications, class_name: 'Classification', foreign_key: :categoryabbr_id, dependent: :destroy
    has_many :organizations, class_name: 'Organization', through: :classification
end
