class User < ApplicationRecord
  has_secure_password
  has_many :password_resets, foreign_key: :user_id, primary_key: :username, dependent: :destroy

  # Associations
  has_many :dependents, class_name: 'Dependent', foreign_key: :userID_id, dependent: :destroy
  has_many :favorites, class_name: 'Favorite', foreign_key: :userID_id, primary_key: 'username', dependent: :destroy
  has_many :favorite_organizations, class_name: 'Organization', through: :favorites
  has_many :reviews, class_name: 'Review', foreign_key: :userID_id, dependent: :destroy
  has_many :reviewed_organizations, class_name: 'Organization', through: :reviews
  has_many :surveys, class_name: 'Survey', foreign_key: :userID_id, dependent: :destroy
  has_many :eventsw,  class_name: 'Event', foreign_key: :user_id, dependent: :destroy
  #this is an array that holds our age ranges
  AGE_RANGES = ['Under 18', '19 - 24', '25 - 34', '35 - 70', '70 and over']
  

  before_save :downcase_email
  before_save :downcase_username, if: :new_record?

  before_destroy :prevent_base_user_destruction
  before_update :prevent_base_user_changes

  # Update associated records when the username changes
  after_update :update_references, if: :username_changed?

  def update_references
    favorites.update_all(userID_id: username)
    reviews.update_all(userID_id: username)
    surveys.update_all(userID_id: username)
    # Add other associated models here if needed
  end
  

  # Validation for a valid email format
  validates :email, format: { with: Devise.email_regexp, message: "Please use a valid email" }

  # Validations for username and email
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 15, message: "Username is too long. It should be 15 characters or fewer." }
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  # Validation for the presence of required fields
  validates :first_name, presence: true
  validates :age_range, presence: true  # Ensure age_range is present
  validates :zipcode, presence: true     # Ensure zipcode is present
  validates :password, presence: true,
  format: {
    with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}\z/,
    message: "must be at least 8 characters long, contain at least one lowercase letter, one uppercase letter, one number, and one special character"
    }, if: :password_required?

    def initiate_password_reset
      token = SecureRandom.urlsafe_base64
      password_reset = password_resets.build(
        reset_digest: User.digest(token),
        reset_sent_at: Time.zone.now
      )
      password_reset.save!
      token  # Return the raw token so it can be used in the email
    end
  
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  private


  # Only require password validation if creating a new record or if password is provided
  def password_required?
    new_record? || password.present?
  end

  def downcase_email
    self.email = email.downcase
  end

  def downcase_username
    self.username = username.downcase
  end

  def prevent_base_user_destruction
    if username == "admin"
      errors.add(:base, "This user cannot be deleted.")
      throw(:abort)
    end
  end

  def prevent_base_user_changes
    if username == "admin"
      if email_changed? || first_name_changed?
        errors.add(:base, "Only the password can be changed for this user.")
        throw(:abort)
      end
    end
  end
end
