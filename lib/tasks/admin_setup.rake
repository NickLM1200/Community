namespace :admin do
  desc "Create default admin if it doesn't exist"
  task create: :environment do
    # Check if the user already exists
    admin = Admin.find_by(username: ENV['DEFAULT_ADMIN_USERNAME'])
    
    if admin.nil?
      # Create the user if they do not exist
      Admin.create!(
        username: ENV['DEFAULT_ADMIN_USERNAME'],
        email: ENV['DEFAULT_ADMIN_EMAIL'],
        firstName: ENV['DEFAULT_ADMIN_FIRST_NAME'],
        password: ENV['DEFAULT_ADMIN_PASSWORD'],
        password_confirmation: ENV['DEFAULT_ADMIN_PASSWORD_CONFIRMATION']
      )
      puts "Default admin created!"
    else
      puts "Default admin already exists."
    end
  end
end
