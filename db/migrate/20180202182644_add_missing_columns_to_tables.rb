class AddMissingColumnsToTables < ActiveRecord::Migration[5.1]
  def change
    add_column :Companies, :password_digest, :string
    add_column :Companies, :usename, :string
    add_column :Companies, :address, :string
  end
end
