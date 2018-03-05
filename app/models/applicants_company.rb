class Applicants_company < ActiveRecord::Base
  belongs_to  :applicant
  belongs_to  :company
end
