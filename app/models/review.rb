class Review < ApplicationRecord
    belongs_to :organization, foreign_key: :organizationID_id, primary_key: :organizationId, optional: false
    belongs_to :user, foreign_key: :userID_id, primary_key: :username, optional: false
    belongs_to :admin, foreign_key: :adminID_id, primary_key: :username, optional: :true

    attr_accessor :require_user

    after_update :admin_changes, if: :saved_change_to_reviewStatus?
    after_save :update_organization_avg_starvalue
    after_destroy :update_organization_avg_starvalue

    validates :starValue, presence: true, inclusion: { in: 1..5, message: "must be between 1 and 5" }
    validates :organizationID_id, presence: true

    self.primary_key = 'reviewID'

    private
    
    def update_organization_avg_starvalue
        avgStarValue = organization.reviews.where(reviewStatus: true).average(:starValue) || 0
        organization.update(avgStarValue: avgStarValue)
    end

    def admin_changes
      if saved_change_to_reviewStatus?
        self.adminID_id = Current.admin.username
        save!
      end
    end  
end
