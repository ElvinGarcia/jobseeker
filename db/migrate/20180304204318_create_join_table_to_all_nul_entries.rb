class CreateJoinTableToAllNulEntries < ActiveRecord::Migration[5.1]
  def change
    drop_table :applicants_jobs
    create_join_table :applicants, :jobs
  end
end
