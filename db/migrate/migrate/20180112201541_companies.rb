class Companies < ActiveRecord::Migration

  def change
    create_table :companies do |t|
      t.string :name
      t.string :description
      t.string :job_postngs_id
      t.string :benefits_id
    end
  end
end
