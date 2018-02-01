class AddPasswordColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :applicants, :password, :string
  end
end
