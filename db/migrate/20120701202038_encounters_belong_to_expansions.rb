class EncountersBelongToExpansions < ActiveRecord::Migration
  def up
    add_column :encounters, :expansion_id, :integer
    add_index :encounters, :expansion_id
  end

  def down
    remove_column :encounters, :expansion_id, :integer
    remove_index :encounters, :expansion_id
  end
end
