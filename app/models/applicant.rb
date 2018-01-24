class Applicant < ActiveRecord::Base
  has_secure_password

  has_many :companies
  has_many :job_postings, through: :job_benefit

  include Slugifiable::Slug

  def self.find_by_slug(slug)
    normalize =  slug.gsub("-"," ").split.select{|x|x.capitalize!}.join(" ")
    Artist.all.find_by({name: normalize})
  end

end
