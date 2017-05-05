require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Arkisto
  class Application < Rails::Application
    I18n.enforce_available_locales = false
    config.log_level = :debug
    config.log_tags  = [:subdomain, :uuid]
    config.logger    = ActiveSupport::TaggedLogging.new(Logger.new(STDOUT))
    config.cache_store = :redis_store, ENV['CACHE_URL'],
                         { namespace: 'arkisto::cache' }
    config.active_job.queue_adapter = :sidekiq
  end
end
