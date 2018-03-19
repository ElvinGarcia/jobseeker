class JobController < ApplicationController
  require 'rack-flash'
  use Rack::Flash

  get '/job/new' do
    @company = Company_helpers.current_user(session)
    erb:'/job/new'
  end

  get '/job/index' do
    if Applicant_helpers.logged_in?(session)
      @company = Company.all
      @user = Applicant_helpers.current_user(session)
      erb:'/job/index'
     else
      redirect to '/'
    end
  end

  get '/job/edit/:id' do
    @job = Job.find(params[:id])
    if session["company_id"] == @job.company.id
    erb:"/job/edit"
    else
      flash[:message] = "You must be signed in inorder to edit this job posting !!"
    end
  end

  post '/job/new' do
      if Company_helpers.logged_in?(session)
        @company = Company_helpers.current_user(session)
        @company.jobs.build(params[:job]).save
         redirect to '/company/postings'
       else
         flash[:message] = "You must be signed in inorder to create a job post !!"
         redirect to '/company/login'
         #company needs to be logged_in to create a posting
      end
  end

  patch '/job/edit/:id' do
    @job = Job.find(params[:id])
    if  Company_helpers.current_user(session).id == @job.company.id
        @job.update(title:params[:title], date:params[:date], job_type: params[:job_type], location: params[:location], requirements:params[:requirements], salary: params[:salary])
        redirect to '/company/postings'
      else
        flash[:message] = "You must be signed in inorder to edit this post !!"
        redirect to '/company/login'
    end
  end

  get '/job/:id' do
    @job = Job.find(params[:id])
    @company = Company.find(@job.company_id)
    erb:"/job/profile"
  end

end
