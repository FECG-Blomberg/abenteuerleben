require 'active_support/core_ext/integer/time'

ENV['HCAPTCHA_SECRET_KEY'] = 'test'
ENV['HCAPTCHA_SITE_KEY'] = 'test'

Rails.application.configure do
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local = true
  config.server_timing = true
  config.active_storage.service = :local
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.delivery_method = :file

  if ENV['email-enabled'] == 'true'
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      user_name: ENV['email-un'],
      password: ENV['email-pw'],
      address: 'sandbox.smtp.mailtrap.io',
      host: 'sandbox.smtp.mailtrap.io',
      port: '2525',
      authentication: :cram_md5
    }
  end

  config.action_mailer.perform_caching = false
  config.active_support.deprecation = :log
  config.active_support.disallowed_deprecation = :raise
  config.active_support.disallowed_deprecation_warnings = []
  config.active_record.migration_error = :page_load
  config.active_record.verbose_query_logs = true
  config.assets.quiet = true
  config.action_cable.disable_request_forgery_protection = true
  config.colorize_logging = true

  config.hosts << 'abenteuerleben.local'
end
