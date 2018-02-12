require_relative 'boot'
require File.expand_path('../boot', __FILE__)
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module StcargaApi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.api_only = false
    config.assets.enabled = true
    config.serve_static_assets = true

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.autoload_paths += %W(#{config.root}/app/services)
    config.assets.paths << Rails.root.join("app", "assets", "fonts")
    config.debug_exception_response_format = :default
    Rails.application.config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'

        resource '*',
          headers: :any,
          methods: [:get, :post, :put, :patch, :delete, :options, :head]
      end
    end
  
    # app_yml = YAML.load(ERB.new(File.read("#{Rails.root}/config/application.yml")).result).symbolize_keys
    # config.action_mailer.delivery_method = :smtp
    # config.action_mailer.smtp_settings = app_yml[:default]['smtp_settings'].symbolize_keys
    # ActionMailer::Base.smtp_settings = app_yml[:default]['smtp_settings'].symbolize_keys
    # config.action_mailer.default_options = { from: app_yml[:default]['email_from'] }
    # ActionMailer::Base.default_options = { from: app_yml[:default]['email_from'] }
  end
end
