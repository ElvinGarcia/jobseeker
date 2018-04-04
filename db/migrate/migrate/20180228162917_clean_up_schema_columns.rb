class CleanUpSchemaColumns < ActiveRecord::Migration[5.1]
  def change
    remove_column :Companies, :benefits_id
    remove_column :Companies, :job_postings_id
    remove_column :Companies, :job_id
    remove_column :Companies,  :applicant_id
    remove_column :applicants, :job_id
    remove_column :jobs, :company_id
    remove_column :jobs, :applicant_id
  end
end
