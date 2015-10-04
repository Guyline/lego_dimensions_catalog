class CreateFigurines < ActiveRecord::Migration
  def change
    create_table :figurines do |t|
      t.references        :dimension
      t.references        :owner
      t.string            :name, :null => false
      t.string            :figurine_type
      t.timestamps
    end
  end
end
