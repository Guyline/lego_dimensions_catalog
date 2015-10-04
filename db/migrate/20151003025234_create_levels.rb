class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.references          :pack
      t.references          :dimension
      t.string              :name
      t.string              :location
      t.timestamps
    end
  end
end
