class CreateNeighborhoods < ActiveRecord::Migration[8.1]
  def change
    create_table :neighborhoods do |t|
      t.string :name
      t.references :expansion, null: false, foreign_key: true

      t.timestamps
    end
  end
end
