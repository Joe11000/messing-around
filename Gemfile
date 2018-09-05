source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails'
# Use postgresql as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma'
# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
gem 'bcrypt'
gem 'paranoia'
# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails'
  gem 'chromedriver-helper'
end

gem 'bootstrap-sass'

group :development do
  gem 'guard-rspec'
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console'
  gem 'listen'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'rails-erd'
  gem 'guard-rails'
end

group :test do
  gem 'rspec-rails'
  gem 'selenium-webdriver'
  gem 'capybara'
  # gem 'shoulda-matchers'
  gem 'shoulda-matchers', git: 'https://github.com/thoughtbot/shoulda-matchers', ref: '7f070cbab458d4a1a00e9566611f5a94f7704464'
  gem 'rspec-sidekiq'
  gem 'sidekiq'
end

group :development, :test do
  gem 'faker'
end

gem 'jquery-rails'
gem 'slim-rails'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'simplecov'
# gem 'devise'

gem "aws-sdk-s3", require: false
gem 'image_processing', '~> 1.2'

gem 'bullet'
gem 'coffee-rails'




# feature testing
group :test do
  gem 'capybara', group: :test
  gem 'chromedriver-helper', group: :test
  gem 'selenium-webdriver', group: :test
end

# visualize models
gem 'rails-erd'

# active storage amazaon s3 cloud image storage
gem "aws-sdk-s3", require: false

# active storage image processing
gem 'image_processing', '~> 1.2'

gem 'bullet'

# Background Jobs
gem 'sidekiq'
gem 'rspec-sidekiq', group: :test
