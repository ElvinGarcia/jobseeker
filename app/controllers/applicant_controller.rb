class ApplicantController < ApplicationController
  require 'rack-flash'
  use Rack::Flash

  get '/applicant/login' do
    if Helpers.logged_in?(session)
      redirect to '/applicant/profile'
    end
    erb:"applicant/index"
  end

  get '/applicant/new' do
    erb:'applicant/new'
  end

  get '/applicant/profile' do
      @user = Helpers.current_user(session)
    erb :'/applicant/profile'
  end

  get '/applicant/logoff' do
    if Helpers.logged_in?(session)
      session.clear
      erb:'/applicant/logoff'
    else
      redirect to "/applicant/login"
    end
  end

  get '/applicant/delete' do
    user = Helpers.current_user(session).destroy
    session.clear
    redirect to "/applicant/login"
  end

  get '/applicant/edit' do
    @user = Helpers.current_user(session)
    erb:"/applicant/edit"
  end

  post '/applicant/new' do
      @user = Applicant.create(username: params[:username] , name: params[:name], address: params[:address], objective: params[:objective], blog: params[:blog], github: params[:github], password: params[:password] )
      session[:user_id]=@user[:id]
    redirect to "/applicant/profile"
  end

  post '/applicant/login' do
    if  @user = Helpers.find_and_auth(params)
      session[:user_id]=@user.id
      erb:'/applicant/profile'
    else
     flash[:message] = "ooh! oh! Something Went Wrong! Either the Username and/or Password is Incorrect!"
      redirect to "/applicant/login"
    end
  end

  patch '/applicant/edit' do
    user = Helpers.current_user(session)

    user.update(name:params[:name], address:params[:address], objective: params[:objective],github: params[:github],blog:params[:blog])

    if !params[:password].empty?
      user.update(password:params[:password])
    end
    redirect to '/applicant/profile'
  end

end
