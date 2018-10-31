Rails.application.configure do
  config.cache_classes = false
  config.consider_all_requests_local = true
  config.eager_load = false
  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end
  config.active_storage.service = :local
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.perform_caching = false
  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load
  config.active_record.verbose_query_logs = true
  config.assets.debug = true
  config.assets.quiet = true

  config.file_watcher = ActiveSupport::EventedFileUpdateChecker
  config.action_mailer.raise_delivery_errors = true

  config.action_mailer.delivery_method = :smtp
  config.action_mailer.default_url_options = {host: ENV["SMTP_HOST"]}
  config.action_mailer.smtp_settings = {
    :address => ENV["SMTP_ADDRESS"],
    :domain => ENV["SMTP_DOMAIN"],
    :port => ENV["SMTP_PORT"],
    :user_name => ENV["SMTP_EMAIL"],
    :password => ENV["SMTP_PASSWORD"],
    :authentication => :plain
  }
end
