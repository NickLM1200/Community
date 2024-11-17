class PasswordReset < ApplicationRecord
  belongs_to :user, foreign_key: :user_id, primary_key: :username

  # Check if the reset request has expired
  def expired?
    reset_sent_at < 1.hour.ago
  end
end
