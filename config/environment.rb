#sets sinatra environment
ENV['SINATRA_ENV'] ||= "development"

#require all dependencies
#setup the database adapter and location
require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])
ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

require_all 'app'
require_all 'lib'
