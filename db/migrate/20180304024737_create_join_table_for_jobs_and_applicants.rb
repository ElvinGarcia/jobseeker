class CreateJoinTableForJobsAndApplicants < ActiveRecord::Migration[5.1]
  def change
    create_join_table :applicants, :jobs 
  end
end
