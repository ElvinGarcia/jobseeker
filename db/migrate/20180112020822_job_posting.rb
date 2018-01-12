class JobPosting < ActiveRecord::Migration[5.1]
  def change
    create_table :JobPostings do |t|
      t.string  :title
      t.string  :date
      t.string  :type
      t.string  :location
      t.string  :requirements
      t.integer  :salary
    end
  end
end
