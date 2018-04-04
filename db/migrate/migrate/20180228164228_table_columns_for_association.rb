class TableColumnsForAssociation < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :company_id, :integer

    create_table :applicants_jobs  do |t|
      t.integer :job_id
      t.integer :company_id
      t.integer :applicant_id
    end

  end
end
