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
      redirect back
    end
  end

  post '/job/new' do
      if Company_helpers.logged_in?(session)
        @company = Company_helpers.current_user(session)
          if @company.jobs.build(params[:job]).valid?
            @company.jobs.build(params[:job]).save
              redirect to '/company/postings'
            else
              @error = @company.jobs.build(params[:job]).errors.messages
              erb:'/job/new'
          end
        else
         flash[:message] = "You must be signed in inorder to create a job post !!"
         redirect back

      end
  end

  patch '/job/edit/:id' do
    @job = Job.find(params[:id])
    if  Company_helpers.current_user(session).id == @job.company.id
        if params[:submit] == "Cancel"
          redirect to '/company/postings'
        elsif @job.update(params[:job])
          redirect to '/company/postings'
        else
          @error = @job.errors.messages
          erb:'/job/edit'
        end
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

  get '/job/delete/:id' do
    company = Company_helpers.current_user(session)
    job = Job.find(params[:id])
    if  company.jobs.include?(job)
      company.jobs.find_by(job.attributes).destroy
      redirect to '/company/postings'
    else
      flash[:message] = "Unable to Delete The post!!"
      redirect back
    end
  end

end
