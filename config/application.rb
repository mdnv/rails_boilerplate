require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Nozomi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Disable load all helpers
    # The controller will include a helper which matches the name of the controller.
    # Eg: MyController will automatically include MyHelper
    config.action_controller.include_all_helpers = false

    # # Don't generate system test files.
    # config.generators.system_tests = nil

    # Require all locale files
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.i18n.default_locale = ENV.fetch('APPLICATION_LANGUAGE') { 'en' }

    # Set timezone
    config.time_zone = ENV.fetch('APPLICATION_TIMEZONE') { 'Eastern Time (US & Canada)' }
    config.active_record.default_timezone = :local
  end
end
