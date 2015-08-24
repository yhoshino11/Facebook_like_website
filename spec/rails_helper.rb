ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'spec_helper'
require 'rspec/rails'
require 'capybara/rspec'
require 'devise'
# Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
unless ENV['FIREFOX_PATH'].nil?
  Selenium::WebDriver::Firefox::Binary.path = ENV['FIREFOX_PATH']
end

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/factories"

  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!

  config.before(:suite) do
    Warden.test_mode!
  end

  config.after(:suite) do
    Warden.test_reset!
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.include Capybara::DSL
  config.include Devise::TestHelpers, type: :controller
  config.include FactoryGirl::Syntax::Methods
  config.include Warden::Test::Helpers
end
