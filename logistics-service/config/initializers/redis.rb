Redis::ConnectionManager.connect

constant_variables = Rails.application.config.consul_config["constant_variables"] || {}

constant_variables.each do |k,v|
  if $redis_constant.get(k).nil?
      $redis_constant.set(k,v)
  end
end


if defined?(PhusionPassenger)
  PhusionPassenger.on_event(:starting_worker_process) do |forked|
    if forked
      Redis::ConnectionManager.connect
    else
      # We're in conservative spawning mode. We don't need to do anything.
    end
  end
end
