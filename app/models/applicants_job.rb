class Applicants_job < ActiveRecord::Base
  belongs_to :job
  belongs_to :company
  belongs_to :applicant
end
