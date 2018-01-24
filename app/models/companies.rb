class Company < ActiveRecord::Base
  has_many :applicants
  has_many :job_benefits
  has_many :job_postings, through: :job_benefit


  include Slugifiable::Slug

  def self.find_by_slug(slug)
    normalize =  slug.gsub("-"," ").split.select{|x|x.capitalize!}.join(" ")
    Artist.all.find_by({name: normalize})
  end

end
