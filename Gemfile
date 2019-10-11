source 'https://rubygems.org'

gem 'rails'
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'turbolinks'
gem 'slim-rails'
gem 'devise'
gem 'paperclip'
gem 'font-awesome-rails'
gem 'nested_form'
gem 'countries'
gem 'gravatarify'
gem 'has_friendship', git: 'https://github.com/yhoshino11/has_friendship.git', branch: 'devel'
gem 'geoip'

group :development, :test do
  gem 'rails_best_practices', require: false
  gem 'brakeman', require: false
  gem 'rubocop', require: false
  gem 'sqlite3'
  gem 'guard-rspec'
  gem 'rspec-rails'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'simplecov', require: false
end

group :test do
  gem 'rails-controller-testing'
  gem 'factory_bot'
  gem 'faker'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'launchy'
  gem 'shoulda-matchers'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

group :development do
  gem 'annotate'
  gem 'rails-erd'

  gem 'pry-rails'
  gem 'hirb'
  gem 'hirb-unicode'
  gem 'html2slim'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
  gem 'puma'
end
