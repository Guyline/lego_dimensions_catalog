class CreateAbilites < ActiveRecord::Migration
  def change
    create_table :abilities do |t|
      t.string            :name, :null => false
      t.string            :description
      t.timestamps
    end
  end
end
