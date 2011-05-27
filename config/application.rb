require File.expand_path('../boot', __FILE__)

require "action_controller/railtie"
require "action_mailer/railtie"
require "active_record/railtie"

Bundler.require(:default, Rails.env) if defined?(Bundler)

module ProofingOven
  class Application < Rails::Application

    config.generators do |g|
      g.controller          :helper => false, :test_framework => false
      g.template_engine     :haml
      g.test_framework      :rspec, :fixture => true, :views => false, :controllers => false
      g.integration_tool    :rspec, :fixture => true, :views => false
      g.fixture_replacement :fabrication
    end

    config.encoding = "utf-8"

    config.filter_parameters += [:password]
    config.action_mailer.default_url_options = { :host => 'localhost:3000' }
  end
end
