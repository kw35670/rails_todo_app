require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module TodoApp
  class Application < Rails::Application
    config.load_defaults 8.0
    config.autoload_lib(ignore: %w[assets tasks])
  end

  config.generators do |g|
    g.assets false
    g.helper false
    g.test_framework :rspec
  end
end
