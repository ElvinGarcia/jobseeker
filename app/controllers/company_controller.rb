class CompanyController < ApplicationController
  require 'rack-flash'
  use Rack::Flash

  get '/company/login' do
    if Company_helpers.logged_in?(session)
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
    if Company_helpers.logged_in?(session)
      @company = Company_helpers.current_user(session)
      erb:"/company/edit"
    else
      flash[:message] = "ooh! oh! You must be signed in to make changes to this profile"
      redirect back
    end
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
      if Company.create(params[:company]).valid?
        session[:company_id]=Company.last.id
        redirect to "/company/profile"
      else
        @error = Company.create(params[:company]).errors.messages
        erb:'/company/new'
      end
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
    @company = Company_helpers.current_user(session)
    if params[:submit] == "Cancel"
      erb:'company/profile'
    elsif @company.update(params[:company])
       flash[:message] = " The Companies' Profile Page has been successfully Updated!"
       erb:'company/profile'
     else
       @error = @company.errors.messages
       erb:'/company/edit'
     end

  end



end
