class AddingForeignkeyColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :Companies, :job_id, :interger
    add_column :Companies, :applicant_id, :interger
  end
end
