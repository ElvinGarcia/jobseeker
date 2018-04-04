class CreateJoinTableForJobsApplicantsTables < ActiveRecord::Migration[5.1]
  def change
    drop_table :applicants_jobs
  end
end
