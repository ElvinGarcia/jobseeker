class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :sessions, :method_override, :sweep
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  set :environment, :development

  get '/' do
    erb :index
  end


end
