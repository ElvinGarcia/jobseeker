class Job < ActiveRecord::Base

  validates :title, presence: true, uniqueness: {message: "already exists"}
  validates :job_type, presence: true
  validates :location, presence: true
  validates :requirements, presence: true


  belongs_to :company

  has_many   :ApplicantsJobs
  has_many   :applicants, through: :ApplicantsJobs


   include Slugifiable::Slug

   def self.find_by_slug(slug)
     normalize =  slug.gsub("-"," ").split.select{|x|x.capitalize!}.join(" ")
     Job.all.find_by({name: normalize})
   end

end
