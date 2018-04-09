class AddColumnToApplicants < ActiveRecord::Migration[5.1]
  def change
    add_column :applicants, :resume, :string
  end
end
