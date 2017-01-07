require 'simplecov'
SimpleCov.start
SimpleCov.add_filter do |src_file|
  /test/ =~ src_file.filename
end

ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "mocha/mini_test"

# Minitest-reporters is a progress-bar-style reporter by default
# but we can alternatively use a document-style reporter.
# https://github.com/kern/minitest-reporters#caveats
require "minitest/reporters"
Minitest::Reporters.use!(
  # Minitest::Reporters::SpecReporter.new # Enable document-style reporter.
)

# Capybara and poltergeist
require 'minitest/rails/capybara'
require 'capybara-screenshot/minitest'
require "capybara/poltergeist"
Capybara.javascript_driver = :poltergeist

# Shoulda-matchers
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :minitest
    with.library :rails
  end
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Make FactoryGirl code concise.
  include FactoryGirl::Syntax::Methods

  # Make helpers available in tests.
  include ApplicationHelper
end

# class ActionDispatch::IntegrationTest
#   include Capybara::DSL
# end

# We want to make ActiveRecord share the same connection between threads.
# Capybara starts the browser in a different thread from the one our application uses.
# http://blog.plataformatec.com.br/2011/12/three-tips-to-improve-the-performance-of-your-test-suite/
# https://gist.github.com/mperham/3049152
class ActiveRecord::Base
  mattr_accessor :shared_connection
  @@shared_connection = nil
  def self.connection
    @@shared_connection || ConnectionPool::Wrapper.new(size: 1) { retrieve_connection }
  end
end
ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection
