class JobBenefits < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs_benefits do |t|
      t.integer :job_postngs_id
      t.integer :benefits_id
    end
  end
end
