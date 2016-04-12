Kemalyst::Application.config do |config|

  # Set the binding host ip address.  Defaults to "0.0.0.0"
  # config.host = "0.0.0.0"

  # Set the port.  Defaults to 3000.
  config.port = (ENV["PORT"] ||= "5000").to_i

  # Set the environment. Defaults to development.
  # config.env = "development"
  
  # By default, Logging will be sent to STDOUT.  You can create a file logger and
  # assign it to the Application.
  # log = File.new("logs/#{config.env}.log", "a")
  # log.flush_on_newline = true
  # config.logger = Logger.new(log)
  # config.logger.level = Logger::DEBUG

  # creating a formatter.  This overrides the default crystal formatter
  # config.logger.formatter = Logger::Formatter.new do |severity, datetime, progname, message, io|
  #   io << "[" << datetime << " #" << Process.pid << "] "
  #   io << severity.rjust(5) << ": " << message
  # end

  # Specify custom HTTP::Handlers.  Handlers are chained together in a link
  # list and each will call the next after processing the context.  The
  # context holds the request and response objects.  Each handler may have
  # their own config file to override default settings.  For example, the
  # Session Handler requires that you change the `secret` in the config/session.cr
  # file.

  # handlers will be chained in the order provided
  config.handlers = [
    Kemalyst::Handler::Logger.instance(config.logger),
    Kemalyst::Handler::Error.instance,
    Kemalyst::Handler::Params.instance,
    Kemalyst::Handler::Cors.instance,  # Add support for CORS headers
    Kemalyst::Handler::Router.instance
  ] 
end
