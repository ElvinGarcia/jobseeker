class RenameJobpostingsTable < ActiveRecord::Migration[5.1]
  def change
    rename_table :JobPostings, :jobposts
  end
end
