class CreateEncounters < ActiveRecord::Migration[8.1]
  def change
    create_table :encounters do |t|
      t.references :location, null: false, foreign_key: true
      t.references :expansion, null: false, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
