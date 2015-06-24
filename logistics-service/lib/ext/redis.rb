class Redis
class ConnectionManager

  def self.connect
    self.disconnect

    $redis = Redis.new(:host => ::Rails.application.config.consul_config['environment_variables']['REDIS_HOST'], :port => ::Rails.application.config.consul_config['environment_variables']['REDIS_PORT'])

    $redis_constant = Redis::Namespace.new(:constant, :redis => $redis)

    return $redis
  end


  def self.disconnect
    if $redis
      $redis.client.disconnect
      if defined?(Rails.logger) && Rails.logger
        Rails.logger.info "Disconnecting to redis"
      end
    end
  end
end
end
