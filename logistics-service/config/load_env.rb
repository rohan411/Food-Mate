ENV['CONTAINER'] ||= 'default'
ENV['CONSUL_HOST'] ||= 'consul.tinyowl.com'
ENV['SENTRY_DSN'] ||= ''

ENV['SERVICE_NAME'] = 'logistics-service'


Conf.configure(url: "http://#{ENV['CONSUL_HOST']}",
               acl_token: ENV['CONSUL_TOKEN'],
               env: Rails.env,
               container: ENV['CONTAINER'],
               service_name: ENV['SERVICE_NAME'],
               sentry_dsn: ENV['SENTRY_DSN'],
               basic_auth_username: ENV["CONSUL_AUTH_USERNAME"],
               basic_auth_password: ENV["CONSUL_AUTH_PASSWORD"])

