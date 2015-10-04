class CreateWorlds < ActiveRecord::Migration
  def change
    create_table :worlds do |t|
      t.references          :dimension
      t.string              :name
      t.timestamps
    end
  end
end
