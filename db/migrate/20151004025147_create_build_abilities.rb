class CreateBuildAbilities < ActiveRecord::Migration
  def change
    create_table :build_abilities do |t|
      t.references          :build
      t.references          :ability
      t.timestamps
    end
  end
end
