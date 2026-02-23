class CreateLocations < ActiveRecord::Migration[8.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.references :neighborhood, null: false, foreign_key: true
      t.references :expansion, null: false, foreign_key: true

      t.timestamps
    end
  end
end
