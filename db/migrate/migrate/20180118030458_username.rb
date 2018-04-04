class Username < ActiveRecord::Migration[5.1]
  def change
    change_table :applicants do |t|
      t.string :username
    end
  end
end
