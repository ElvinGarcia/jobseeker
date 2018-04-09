class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :sessions, :method_override, :sweep
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  set :environment, :development


  get '/' do
    if session.include?("user_id")
      redirect to '/applicant/login'
    elsif session.include?("company_id")
      redirect to '/company/login'
    else
      erb :index
    end

  end


end
