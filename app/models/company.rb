class Company < ActiveRecord::Base
  has_secure_password
   has_many :ApplicantsJobs
   has_many :Companies_applicants

   has_many :applicants, through: :Companies_applicant
   has_many :jobs



  include Slugifiable::Slug

  def self.find_by_slug(slug)
    normalize =  slug.gsub("-"," ").split.select{|x|x.capitalize!}.join(" ")
    Company.all.find_by({name: normalize})
  end

end
