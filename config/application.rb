require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module FnfZettheme
  class Application < Rails::Application
    config.i18n.fallbacks = true
    config.time_zone = 'Kyiv'
    config.i18n.default_locale = :uk
    config.i18n.available_locales = [:en, :ru, :uk]
    config.active_record.timestamped_migrations = false
    config.active_record.raise_in_transactional_callbacks = true
    config.exceptions_app = self.routes
    config.assets.paths << "#{Rails}/vendor/assets/fonts"
    config.autoload_paths << Rails.root.join('lib')
  end
end
