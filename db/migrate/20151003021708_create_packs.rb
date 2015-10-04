class CreatePacks < ActiveRecord::Migration
  def change
    create_table :packs do |t|
      t.references        :wave
      t.string            :name, :null => false
      t.integer           :set_number
      t.decimal           :price,
        :precision => 5,
        :scale => 2
      t.string            :pack_type
      t.timestamps
    end
  end
end
