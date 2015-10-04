class CreateFigurineAbilities < ActiveRecord::Migration
  def change
    create_table :figurine_abilities do |t|
      t.references          :figurine
      t.references          :ability
      t.timestamps
    end
  end
end
