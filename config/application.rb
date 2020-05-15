require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module HoneySkeleton
  class Application < Rails::Application
    config.assets.quiet = true

    config.generators do |g|
      g.helper false
      g.javascript_engine false
      g.request_specs false
      g.routing_specs false
      g.stylesheets false
      g.test_framework :rspec
      g.view_specs false
      g.fixture_replacement :factory_bot, dir: 'spec/factories'
      g.template_engine :slim
      g.serializer false
    end

    config.action_controller.action_on_unpermitted_parameters = :raise
    config.load_defaults 5.1

    config.generators.system_tests = nil

    config.active_record.belongs_to_required_by_default = false

    Faker::Config.locale = 'en-US'
    config.time_zone = 'Eastern Time (US & Canada)'
    config.active_record.default_timezone = :utc
    config.beginning_of_week = :sunday
  end
end
