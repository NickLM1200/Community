class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  before_save :downcase_email
  before_save :downcase_username, if: :new_record?

  private

  def downcase_username
    self.username = username.downcase
  end

  def downcase_email
    self.email = email.downcase
  end
end
