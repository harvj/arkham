class CreateEncounters < ActiveRecord::Migration
  def change
    create_table :encounters do |t|
      t.text :string
      t.integer :location_id

      t.timestamps
    end
    add_index :encounters, :location_id
  end
end
