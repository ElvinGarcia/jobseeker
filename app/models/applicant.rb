class Applicant < ActiveRecord::Base
  has_secure_password
  has_many :applicants_jobs
  has_many :Companies_applicants

  has_many :companies, through: :Companies_applicant
  has_many :jobs, through: :applicants_job



  include Slugifiable::Slug

  def self.find_by_slug(slug)
    normalize =  slug.gsub("-"," ").split.select{|x|x.capitalize}.join(" ")
    Applicant.all.find_by({name: normalize}) || Applicant.all.find_by({username: normalize})
  end

end
