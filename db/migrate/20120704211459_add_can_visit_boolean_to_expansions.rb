class AddCanVisitBooleanToExpansions < ActiveRecord::Migration
  def change
    add_column :expansions, :can_visit, :boolean, :default => false
  end
end
