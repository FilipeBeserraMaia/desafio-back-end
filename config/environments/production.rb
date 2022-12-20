require "active_support/core_ext/integer/time"

Rails.application.configure do
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = false
  config.public_file_server.enabled = ENV["RAILS_SERVE_STATIC_FILES"].present?
  config.assets.compile = false
  config.active_storage.service = :local
  config.force_ssl = false
  config.log_level = :info
  config.log_tags = [:request_id]
  config.action_mailer.perform_caching = false
  config.i18n.fallbacks = true
  config.active_support.report_deprecations = false
  config.log_formatter = ::Logger::Formatter.new
  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger = ActiveSupport::TaggedLogging.new(logger)
  end
  config.active_record.dump_schema_after_migration = false
  config.action_mailer.smtp_settings = {
    :user_name => 'apikey',
    :password => MAILER_PASSWORD,
    :address => 'smtp.sendgrid.net',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
  }
  config.assets.quiet = true
  config.i18n.default_locale = :pt

  config.assets.compress = true
  config.assets.digest = true
  config.assets.initialize_on_precompile = false

  config.assets.compile = true
end
