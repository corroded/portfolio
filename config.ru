begin
  # try to run as library (development)
  require './slippers_lib/ruby_slippers'
rescue LoadError
  # run as gem (lib not installed)
  require 'ruby_slippers'
end

require 'sass/plugin/rack'
require 'compass'

# Compass
Compass.add_project_configuration("compass.config")
Compass.configure_sass_plugin!

# Rack config
use Rack::CommonLogger
use Rack::Static,
  :urls => ['/css', '/js', '/img', '/favicon.ico'], :root => 'public'

# Middleware
use Sass::Plugin::Rack    # Compile Sass on the fly

require File.expand_path("../config", __FILE__)

run $app
