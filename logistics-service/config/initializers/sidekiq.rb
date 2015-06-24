require 'sidekiq'
require 'sidekiq/web'

Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
  [user, password] == ['admin', Rails.application.config.consul_config['environment_variables']['SIDEKIQ_PASSWORD']]
end

redisServer = Rails.application.config.consul_config['environment_variables']['SIDEKIQ_REDIS_HOST'].to_s
Sidekiq.configure_server do |config|
  config.redis = { :url => 'redis://' + redisServer + ":#{Rails.application.config.consul_config['environment_variables']['SIDEKIQ_REDIS_PORT']}/0" }
  config.failures_max_count = 5000
end

Sidekiq.configure_client do |config|
  config.redis = { :url => 'redis://' + redisServer + ":#{Rails.application.config.consul_config['environment_variables']['SIDEKIQ_REDIS_PORT']}/0" }
  config.failures_max_count = 5000
end