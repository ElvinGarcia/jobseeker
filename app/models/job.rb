class Job < ActiveRecord::Base
  has_many   :applicants_jobs
  has_many   :applicants, through: :applicants_job 
  belongs_to :company

   include Slugifiable::Slug

   def self.find_by_slug(slug)
     normalize =  slug.gsub("-"," ").split.select{|x|x.capitalize!}.join(" ")
     Job.all.find_by({name: normalize})
   end

end
