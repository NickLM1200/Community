class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  before_save :downcase_usernameemail

  private

  def downcase_usernameemail
    self.username = username.downcase
    self.email = email.downcase
  end
end
