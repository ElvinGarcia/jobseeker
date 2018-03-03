class AddingApplicantIdColumnToJobTable < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :applicant_id, :interger
  end
end
