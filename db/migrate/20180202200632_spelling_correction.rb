class SpellingCorrection < ActiveRecord::Migration[5.1]
  def change
    rename_column :Companies, :usename, :username
  end
end
