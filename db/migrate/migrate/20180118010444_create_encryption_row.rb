class CreateEncryptionRow < ActiveRecord::Migration[5.1]
  def change
    change_table :applicants do |t|
      t.string :password_digest
    end
  end
end
