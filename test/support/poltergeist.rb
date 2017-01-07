# We want to use poltergeist only when we test javascript features
# so that the rest of the test suite can run faster.
# So we set the current_driver of capybara to nil after each test.
class ActiveSupport::TestCase

  # temporarily select different driver
  require 'capybara/poltergeist'
  Capybara.current_driver = :poltergeist

  def teardown
    # switch back to default driver
    Capybara.use_default_driver
  end
end
