require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LoginUsersDemo
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # https://github.com/blowmage/minitest-rails
    config.generators do |g|
      g.assets   = false
      g.helpers  = false
      g.jbuilder = false
      g.template_engine :slim
      g.test_framework :minitest, spec: true, fixture: false
      g.fixture_replacement :factory_girl, dir: 'test/factories'
    end
  end
end
