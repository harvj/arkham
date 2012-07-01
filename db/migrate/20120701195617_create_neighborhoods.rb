class CreateNeighborhoods < ActiveRecord::Migration
  def change
    create_table :neighborhoods do |t|
      t.string :name
      t.integer :expansion_id

      t.timestamps
    end
    add_index :neighborhoods, :expansion_id
  end
end
