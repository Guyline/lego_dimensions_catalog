class CreateWaves < ActiveRecord::Migration
  def change
    create_table :waves do |t|
      t.integer         :number
      t.date            :release_date
      t.timestamps
    end
  end
end
