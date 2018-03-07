class JobController < ApplicationController
  require 'rack-flash'
  use Rack::Flash

  get '/job/new' do
    @user = Company_helpers.current_user(session)
    binding.pry
    erb:'/job/new'
  end

  get '/job/index' do
      @company = Company.all
      erb:'/job/index'
  end

  get '/job/edit/:id' do
    @job = Job.find(params[:id])
    if session["company_id"] == @job.company.id
    erb:"/job/edit"
    else
      binding.pry
    end
  end

  post '/job/new' do
      if Company_helpers.logged_in?(session)

        @company = Company_helpers.current_user(session)
      #  binding.pry
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
binding.pry
        @job.update(title:params[:title], date:params[:date], job_type: params[:job_type], location: params[:location], requirements:params[:requirements], salary: params[:salary])
        redirect to '/company/postings'
      else
        binding.pry
    end
  end

  get '/job/:id' do
    @job = Job.find(params[:id])
    @company = Company.find(@job.company_id)
    erb:"/job/profile"
  end

end
