ENV["RACK_ENV"] ||= "development"

require 'bundler'
require 'json'

Bundler.setup

Bundler.require(:default, ENV["RACK_ENV"].to_sym)

# Setup mongodb connection
require 'mongoid'
Mongoid.load!("config/mongoid.yml")

Dir["./lib/**/*.rb"].each { |f| require f }
