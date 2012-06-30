class CreateExpansionLocations < ActiveRecord::Migration
  def change
    create_table :expansion_locations do |t|
      t.integer :expansion_id
      t.integer :location_id

      t.timestamps
    end
    add_index :expansion_locations, :expansion_id
    add_index :expansion_locations, :location_id
  end
end
