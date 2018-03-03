class Company < ActiveRecord::Base
  has_secure_password
   has_many :applicants_jobs
   has_many :applicants, through: :applicants_job
   has_many :jobs



  include Slugifiable::Slug

  def self.find_by_slug(slug)
    normalize =  slug.gsub("-"," ").split.select{|x|x.capitalize!}.join(" ")
    Company.all.find_by({name: normalize})
  end

end
