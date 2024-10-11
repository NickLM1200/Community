source "https://rubygems.org"

ruby "3.3.5"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.1.0"

#adding bootstraps latests stable release
gem 'bootstrap', '~> 5.3.3'
gem 'autoprefixer-rails'
gem 'popper_js', '~> 2.11.8'
gem 'execjs'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"

# Frontend management
gem 'jsbundling-rails'  # Manages JavaScript with modern bundlers like esbuild, rollup.js.
gem 'cssbundling-rails'  # Manages CSS with tools like Tailwind CSS, Bootstrap.

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Styling
gem 'sass-rails', '>= 6'  # Use Sass for rich CSS with variables and mixins.

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Authentication and authorization
gem 'devise'  # Handles authentication with ready-to-use strategies and views.
gem 'pundit'  # Provides a set of helpers to enforce permission policies.



# Use Redis adapter to run Action Cable in production
gem "redis", ">= 4.0.1"

# Background processing for Ruby, using Redis for storage.
gem 'sidekiq', '~> 6.0'  

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

#adding to fix warning: will no longer be included as a default gem starting from Ruby 3.5.0.
gem 'ostruct'

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ]
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"
  gem 'byebug'  # Debugging tool for Ruby.
  gem 'rspec-rails'  # Testing framework for Rails applications.
  gem 'factory_bot_rails'  # Provides a framework for setting up Ruby objects as test data.
  gem 'pry-rails'  # Provides a powerful alternative to the standard IRB shell for Ruby.

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
end

# Remember to regularly update dependencies to benefit from security patches, bug fixes, and performance improvements.
# Use 'bundle update' to update gems while respecting the specified versions.