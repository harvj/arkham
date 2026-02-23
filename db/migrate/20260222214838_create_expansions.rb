class CreateExpansions < ActiveRecord::Migration[8.1]
  def change
    create_table :expansions do |t|
      t.string :name
      t.string :box_type
      t.boolean :can_visit, default: false

      t.timestamps
    end
  end
end
