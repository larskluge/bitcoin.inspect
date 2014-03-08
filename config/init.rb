ENV['ENV'] ||= 'development'

require 'dotenv'
Dotenv.load

require 'bundler'
Bundler.require(:default, ENV['ENV'])

require 'active_support/core_ext/object'
require 'active_support/core_ext/string'
require 'active_support/core_ext/hash'

Dir['./config/initializers/*.rb', './lib/*.rb', './models/*.rb'].each do |file|
  require file
  also_reload file
end

include BtcUtils::Models

