class ApplicantController < ApplicationController
  require 'rack-flash'
  use Rack::Flash

  get '/applicant/login' do
    if Applicant_helpers.logged_in?(session)
      redirect to '/applicant/profile'
    else
      flash[:message] = "ooh! oh! You are currently not logged in"
    end
    erb:"applicant/index"
  end

  get '/applicant/new' do
    erb:'applicant/new'
  end

  get '/applicant/profile' do
      @user = Applicant_helpers.current_user(session)
    erb :'/applicant/profile'
  end

  get '/applicant/job/delete/:id' do
    if Applicant_helpers.logged_in?(session)
       user = Applicant_helpers.current_user(session)
      if job = user.jobs.find(params[:id])
        user.jobs.delete(job)
        flash[:message] = "Your Applican was Successfully Retracted"
        redirect to '/applicant/profile'
      else
        flash[:message] = "Retraction Was Unsuccessul! Please Try Again Later"
      end
    end
  end


  get '/applicant/job/:id' do
    if Applicant_helpers.logged_in?(session)
        job = Job.find(params[:id])
        @user = Applicant_helpers.current_user(session).jobs << job
          flash[:message] = "Your Application Was submmited Successfully!"
          redirect to '/applicant/profile'
     else
        flash[:message] = "ooh! oh! You are currently not logged in"
        redirect to '/applicant/login'
    end
  end

  get '/applicant/logoff' do
    if Applicant_helpers.logged_in?(session)
      session.clear
      erb:'/applicant/logoff'
    else
      redirect to "/applicant/login"
    end
  end

  get '/applicant/delete' do
    if Applicant_helpers.logged_in?(session)
      user = Applicant_helpers.current_user(session).destroy
      session.clear
      redirect to "/applicant/login"
    else
       flash[:message] = "ooh! oh! You are currently not logged in"
    end
  end

  get '/applicant/edit' do
    if Applicant_helpers.logged_in?(session)
      @user = Applicant_helpers.current_user(session)
      erb:"/applicant/edit"
    else
      flash[:message] = "ooh! oh! You are currently not logged in"
    end
  end

  get '/applicant/profile/:slug' do
    if @user = Applicant.find_by_slug(params[:slug])
      erb :'/applicant/profile'
    else
       flash[:message] ="ooh! oh! that user profile doesn't exist or its private"
    end
  end


  post '/applicant/new' do
      @user = Applicant.create(params[:applicant] )
      session[:user_id]=@user.id
    redirect to "/applicant/profile"
  end

  post '/applicant/login' do
    if  @user = Applicant_helpers.find_and_auth(params)
      session[:user_id]=@user.id
      erb:'/applicant/profile'
    else
     flash[:message] = "ooh! oh! Something Went Wrong! Either the Username and/or Password is Incorrect!"
      redirect to "/applicant/login"
    end
  end

  patch '/applicant/edit' do
   if Applicant_helpers.logged_in?(session)
     user = Applicant_helpers.current_user(session)
        user.update(name:params[:name], address:params[:address], objective: params[:objective],github: params[:github],blog:params[:blog])
     if !params[:password].empty?
       user.update(password:params[:password])
     end
     redirect to '/applicant/profile'
   else
     flash[:message] = "ooh! oh! You are currently not logged in"
   end

  end



end
