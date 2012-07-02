class EncounterIsTextNotString < ActiveRecord::Migration
  def up
    remove_column :encounters, :text
    add_column :encounters, :description, :text
  end

  def down
    remove_column :encounters, :description
    add_column :encounters, :text, :string
  end
end
