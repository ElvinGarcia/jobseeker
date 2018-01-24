class ApplicantController < ApplicationController


  get '/new' do
    erb :'applicant/new'
  end

  post '/new' do
    @applicant = Applicant.find_or_create_by(username: params[:username] , name: params[:name], address: params[:address] ,  objective: params[:objective],  blog: params[:blog] )
    redirect to '/users/:id'
  end

  get '/users/:id' do
    binding.pry
  end

end
