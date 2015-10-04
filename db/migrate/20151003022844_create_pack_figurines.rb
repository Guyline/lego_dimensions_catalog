class CreatePackFigurines < ActiveRecord::Migration
  def change
    create_table :pack_figurines do |t|
      t.references          :pack
      t.references          :figurine
      t.timestamps
    end
  end
end
