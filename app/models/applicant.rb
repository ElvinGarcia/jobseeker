class Applicant < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password, presence: true, confirmation: true, length:{in: 6...20}, :if => :password

  has_secure_password

  has_many :ApplicantsJobs
  has_many :jobs, through: :ApplicantsJobs, dependent: :destroy



  include Slugifiable::Slug

  def self.find_by_slug(slug)
    normalize =  slug.gsub("-"," ").split.select{|x|x.capitalize}.join(" ")
    Applicant.all.find_by({name: normalize}) || Applicant.all.find_by({username: normalize})
  end

end
