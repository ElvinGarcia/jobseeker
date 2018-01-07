require_relative 'config/environment'

#auto-add controllers
Dir.glob(File.dirname(__FILE__) + '/*.rb').each do |controller|
 require(controller)
end

run ApplicationController
use Rack::MethodOverride
