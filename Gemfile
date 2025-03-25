source 'https://rubygems.org'

  #use sinatra for routing
  gem 'sinatra', '>= 4.1.0' # Upgrade Sinatra to a version higher than 4.1.025184
  #use activerecord to bind database to ruby's classes
  gem 'activerecord', :require => 'active_record'
  #extends sinatra with ActiveRecord helpers
  gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
  #database of choice
  gem 'sqlite3'
  #middleware
  gem 'rack', '>= 2.2.11' # Upgrade Rack to a version higher than 2.2.11610
  #loads all code in a file
  gem 'require_all'
  #a wrapper that provides hashing algorithm for handling passwords
  # Use ActiveModel has_secure_password
  gem 'bcrypt'
  #flash alert
  gem 'rack-flash3'


group :development do
  #interact with helpers, view rendering and your app's response objects, commands to view your app's routes and settings
  gem 'tux'
  #ensure database is clean when running test
  gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
  #IRB alternative
  gem 'pry'
  #rack development server
  gem 'shotgun'
  #web server
  gem 'puma', '>= 6.2.1' # Ensure puma is updated to address CVE-2025-27111
end


group :test do
  #use for unit testing
  gem 'rspec'
end
