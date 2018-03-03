class DropingUnneccessaryTables < ActiveRecord::Migration[5.1]
  def change
    drop_table :jobs_benefits
    drop_table :benefits
  end
end
