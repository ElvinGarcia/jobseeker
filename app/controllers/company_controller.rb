class CompanyController < ApplicationController
  require 'rack-flash'
  use Rack::Flash

  get '/company/login' do
    if Company_helpers.logged_in?(session)
      @company = Company_helpers.current_user(session)
      redirect to '/company/profile'
    end
    erb:"/company/index"
  end


  get '/company/new' do
    erb:'company/new'
  end

  get '/company/profile' do
      @company = Company_helpers.current_user(session)
    erb:'/company/profile'
  end

  get '/company/logoff' do
    if Company_helpers.logged_in?(session)
      session.clear
      erb:'/company/logoff'
    else
      redirect to "/company/login"
    end
  end

  get '/company/delete' do
    company = Company_helpers.current_user(session).destroy
    session.clear
    redirect to "/company/login"
  end

  get '/company/edit' do
    @company = Company_helpers.current_user(session)
    erb:"/company/edit"
  end

  get '/company/postings' do
     if Company_helpers.logged_in?(session)
        @company = Company_helpers.current_user(session)
        erb:'/company/postings'
      else
        redirect to '/company/login'
     end
  end

  get '/company/:id' do
    @company = Company.find(params[:id])
    erb:'/company/profile'
  end

  post '/company/new' do
      @company = Company.create(params[:company])
      session[:company_id]=@company.id
    redirect to "/company/profile"
  end

  post '/company/login' do
    if  @company = Company_helpers.find_and_auth(params)
      session[:company_id]=@company.id
      erb:'/company/profile'
    else
     flash[:message] = "ooh! oh! Something Went Wrong! Either the Username and/or Password is Incorrect!"
      redirect to "/company/login"
    end
  end


  patch '/company/edit' do
    company = Company_helpers.current_user(session)
binding.pry
    company.update(params[:company])
    # if !params[:password].empty?
    #   user.update(password:params[:password])
    # end
    redirect to '/company/profile'
  end



end
