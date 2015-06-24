require 'raven'

Raven.configure do |config|
  config.environments = %w( production feature )
  config.dsn = ENV['SENTRY_DSN']
  config.timeout = 2
  config.async = lambda { |event|
    Thread.new { Raven.send(event) }
  }
end