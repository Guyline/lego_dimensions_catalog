class CreateBuilds < ActiveRecord::Migration
  def change
    create_table :builds do |t|
      t.references        :figurine
      t.string            :name
      t.integer           :version
      t.timestamps
    end
  end
end
