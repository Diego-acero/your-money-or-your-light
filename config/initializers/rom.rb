ROM::Rails::Railtie.configure do |config|
  user = ENV.fetch('DATABASE_USERNAME')
  pass = ENV.fetch('DATABASE_PASSWORD')
  host = ENV.fetch('DATABASE_HOST')
  port = ENV.fetch('DATABASE_PORT')
 config.gateways[:default] = [:sql, "postgresql://" + user + ":" + pass + "@" + host + ":" + port]
end
