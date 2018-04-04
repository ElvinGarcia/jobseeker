class DeleteUnncessaryTables < ActiveRecord::Migration[5.1]
  def change
    drop_table :Companies_applicants
  end
end
