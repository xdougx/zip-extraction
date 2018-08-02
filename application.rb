$:.unshift File.dirname(__FILE__)
env = :development

require 'bundler'
Bundler.require :default, env
require 'erb'
require 'active_support/all'

module Application
  include ActiveSupport::Configurable
end


Application.configure do |config|
  config.root     = File.dirname(__FILE__)
  config.env      = ActiveSupport::StringInquirer.new(env.to_s)
end
# ActiveRecord
# db_config = YAML.load(ERB.new(File.read("config/database.yml")).result)[Application.config.env]
# ActiveRecord::Base.default_timezone = :utc
# ActiveRecord::Base.establish_connection(db_config)

# Mongo
# Mongoid.load!("config/mongoid.yml", env)

# specific_environment = "config/environments/#{Application.config.env}.rb"
# require specific_environment if File.exists? specific_environment
# Dir["config/initializers/**/*.rb"].each {|f| require f}

Dir["#{File.dirname(__FILE__)}/app/**/*.rb"].each {|f| require f}

