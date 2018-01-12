class Benefits < ActiveRecord::Migration[5.1]
  def change
    create_table :benefits do |t|
        t.string  :insurance
        t.string  :education
        t.string  :travel
        t.string  :vacation
    end
  end
end
