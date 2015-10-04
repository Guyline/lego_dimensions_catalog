class CreateLevelAbilities < ActiveRecord::Migration
  def change
    create_table :level_abilities do |t|
      t.references        :level
      t.references        :ability
      t.timestamps
    end
  end
end
