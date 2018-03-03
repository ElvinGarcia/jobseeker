class RenameColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :jobs, :type, :job_type
  end
end
