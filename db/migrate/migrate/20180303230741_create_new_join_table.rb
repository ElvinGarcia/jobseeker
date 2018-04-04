class CreateNewJoinTable < ActiveRecord::Migration[5.1]
  def change
    remove_column :applicants_jobs, :company_id

    create_join_table :Companies, :applicants do |t|
      t.index  :applicant_id
      t.index  :company_id
    end
  end
end
