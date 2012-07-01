class LocationsBelongToNeighborhoods < ActiveRecord::Migration
  def up
    drop_table :expansion_locations

    add_column :locations, :neighborhood_id, :integer
    add_column :locations, :expansion_id, :integer
    add_index :locations, :expansion_id
    add_index :locations, :neighborhood_id
  end


  def down
    create_table :expansion_locations do |t|
      t.integer :expansion_id
      t.integer :location_id

      t.timestamps
    end
    add_index :expansion_locations, :expansion_id
    add_index :expansion_locations, :location_id

    remove_column :locations, :neighborhood_id
    remove_column :locations, :expansion_id
    remove_index :locations, :expansion_id
    remove_index :locations, :neighborhood_id
  end
end
