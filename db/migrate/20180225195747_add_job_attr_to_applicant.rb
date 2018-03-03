class AddJobAttrToApplicant < ActiveRecord::Migration[5.1]
  def change
    add_column :applicants, :job_id, :interger
  end
end
