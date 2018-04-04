class Applicants < ActiveRecord::Migration
  def change
    create_table :applicants do |t|
      t.string :name
      t.string :address
      t.string :objective
      t.string :github
      t.string :blog
    end
  end
end
