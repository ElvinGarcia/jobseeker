class ApplicantController < ApplicationController
  require 'rack-flash'
  use Rack::Flash

  get '/applicant/login' do
    if Applicant_helpers.logged_in?(session)
      redirect to '/applicant/profile'
    else
    erb:"applicant/index"
    end
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
        flash[:message] = "Your Applicantion was Successfully Retracted"
        redirect to '/applicant/profile'
      else
        flash[:message] = "Retraction Was Unsuccessul! Please Try Again Later"
        redirect back
      end
    else
      flash[:message] = "You Must Be Logged In Inorder To Delete This Posting"
      redirect back
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
        redirect back
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
       redirect back
    end
  end

  get '/applicant/edit' do
    if Applicant_helpers.logged_in?(session)
      @user = Applicant_helpers.current_user(session)
      erb:"/applicant/edit"
    else
      flash[:message] = "ooh! oh! You are currently not logged in"
      redirect back
    end
  end

  get '/applicant/profile/:slug' do
    if @user = Applicant.find_by_slug(params[:slug])
      erb :'/applicant/profile'
    else
       flash[:message] ="ooh! oh! The User Profile Requested Doesn't Exist Or It Is Private"
       redirect back
    end
  end


  post '/applicant/new' do
      if Applicant.create(params[:applicant]).valid?
        session[:user_id]=Applicant.last.id
        redirect to "/applicant/profile"
      else
        @error = Applicant.create(params[:applicant]).errors.messages
        erb:'/applicant/new'
      end
  end

  post '/applicant/login' do
    if  @user = Applicant_helpers.find_and_auth(params)
      session[:user_id]=@user.id
      erb:'/applicant/profile'
    else
      flash[:message] = "Either The Password or Username is incorrect !"
      redirect to "/applicant/login"
    end
  end

  patch '/applicant/edit' do
   if Applicant_helpers.logged_in?(session)
     @user = Applicant_helpers.current_user(session)
      if  @user.update(params[:applicant])
        
        flash[:message] = "Your Profile Has Been Updated Successfully !"
        erb:'/applicant/profile'
      else
        @error = @user.errors.messages
        erb:'/applicant/edit'
     end
   else
     flash[:message] = "ooh! oh! You are currently not logged in"
     redirect back
   end

  end



end
