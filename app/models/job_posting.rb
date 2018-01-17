class Jobpost < ActiveRecord::Base
  belongs_to :company
  has_many :job_benefits
  

  include Slugifiable::Slug

  def self.find_by_slug(slug)
    normalize =  slug.gsub("-"," ").split.select{|x|x.capitalize!}.join(" ")
    Artist.all.find_by({name: normalize})
  end

end
