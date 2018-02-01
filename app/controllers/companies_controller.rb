class CompaniesController < ApplicationController


  get '/companies/new' do
    erb :'companies/new'
  end

  get '/companies/profile' do
      @user = Helpers.current_user(session)
    erb:'/companies/profile'
  end

  post '/companies/new' do
      @user = business.create(username: params[:username] , name: params[:name], address: params[:address], objective: params[:objective], blog: params[:blog], github: params[:github], password: params[:password] )
      session[:user_id]=business[:id]
    redirect to "/companies/profile"
  end

  post '/companies/login' do
    if  @user = Helpers.find_and_auth(params)
      session[:user_id]=@user.id
      erb:'/companies/profile'
    else
     flash[:message] = "ooh! oh! Something Went Wrong! Either the Username and/or Password is Incorrect!"
      redirect to "/"
    end
  end

  get '/companies/logoff' do
    if Helpsers.logged_in?(session)
      session.clear
      erb:'/logoff'
    else
      redirect to "/login"
    end
  end

  get '/companies/delete' do
    user = Helpers.current_user(session).destroy
    session.clear
    redirect to "/"
  end

  get '/companies/edit' do
    @user = Helpers.current_user(session)
    erb:"/companies/edit"
  end

  patch '/companies/edit' do
    user = Helpers.current_user(session)

    user.update(name:params[:name], address:params[:address], objective: params[:objective],github: params[:github],blog:params[:blog])

    if !params[:password].empty?
      user.update(password:params[:password])
    end
    redirect to '/companies/profile'
  end



end
