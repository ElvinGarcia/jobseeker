class Company < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, Confirmation: true, length:{in: 6..20}, :if => :password

   has_many :ApplicantsJobs
   # has_many :CompaniesApplicants #ApplicantsCompanies
   # has_many :applicants, through: :CompaniesApplicants #ApplicantsCompanies
   has_many :jobs, dependent: :destroy



  include Slugifiable::Slug

  def self.find_by_slug(slug)
    normalize =  slug.gsub("-"," ").split.select{|x|x.capitalize!}.join(" ")
    Company.all.find_by({name: normalize})
  end

end
