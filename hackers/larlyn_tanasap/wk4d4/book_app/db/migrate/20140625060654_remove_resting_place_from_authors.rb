class RemoveRestingPlaceFromAuthors < ActiveRecord::Migration
  def change
    remove_column :authors, :resting_place, :string
  end
end
