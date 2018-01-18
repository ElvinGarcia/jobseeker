class ApplicantController < ApplicationController


  get '/new' do
    erb :'applicant/new'
  end

  post '/new' do
    binding.pry
  end

end
