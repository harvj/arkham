class AddBoxTypeToExpansion < ActiveRecord::Migration
  def change
    add_column :expansions, :box_type, :string
  end
end
