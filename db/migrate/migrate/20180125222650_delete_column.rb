class DeleteColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :applicants, :password
  end
end
