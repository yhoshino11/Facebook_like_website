ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'spec_helper'
require 'rspec/rails'
require 'capybara/rails'
require 'selenium-webdriver'
require 'capybara/rspec'
require 'devise'
require 'brakeman'
# Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

Capybara.configure do |capybara_config|
  capybara_config.default_driver = :selenium_chrome
  capybara_config.default_max_wait_time = 10 # 一つのテストに10秒以上かかったらタイムアウトするように設定しています
end
# Capybaraに設定したドライバーの設定をします
Capybara.register_driver :selenium_chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('headless') # ヘッドレスモードをonにするオプション
  options.add_argument('--disable-gpu') # 暫定的に必要なフラグとのこと
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.server = :webrick
Capybara.javascript_driver = :selenium_chrome

Selenium::WebDriver::Firefox::Binary.path = ENV['FIREFOX_PATH'] unless ENV['FIREFOX_PATH'].nil?

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/factories"

  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!

  config.before(:suite) do
    DatabaseCleaner.clean
    Warden.test_mode!
  end

  config.after(:suite) do
    DatabaseCleaner.clean
    Warden.test_reset!

    # Brakeman
    example_group = RSpec.describe('Brakeman Issues')
    example = example_group.example('must have 0 Critical Security Issues') do
      res = Brakeman.run app_path: "#{Rails.root}", output_files: ['brakeman.html']
      serious = res.warnings.count { |w| w.confidence==0 }
      puts "\n\nBrakeman Result:\n  Critical Security Issues = #{serious}"
      expect(serious).to eq 0
    end
    puts "\nBrakeman Report available here: ./brakeman.html"
    example_group.run
    passed = example.execution_result.status == :passed
    RSpec.configuration.reporter.example_failed example unless passed

    # Rails Best Practices
    exec("bundle exec rails_best_practices -f html")
  end

  config.before(:each) do
    DatabaseCleaner.clean
    FactoryBot.reload
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.before(:all) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start
  end

  config.include Capybara::DSL
  config.include Devise::TestHelpers, type: :controller
  config.include FactoryBot::Syntax::Methods
  config.include Warden::Test::Helpers
  config.include Shoulda::Matchers::ActiveModel, type: :model
  config.include Shoulda::Matchers::ActiveRecord, type: :model
end
