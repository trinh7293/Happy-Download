require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module HappyDownload
  class Application < Rails::Application
  end
end
