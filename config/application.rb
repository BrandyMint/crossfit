require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Crossfit
  class Application < Rails::Application
    config.autoload_paths += %W(#{config.root}/lib)

    config.action_controller.include_all_helpers = false

    config.time_zone = 'Moscow'

    config.encoding = 'utf-8'

    config.i18n.default_locale = :ru
    config.i18n.locale = :ru

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
  end
end
