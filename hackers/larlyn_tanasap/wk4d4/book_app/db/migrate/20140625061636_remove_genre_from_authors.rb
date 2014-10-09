class RemoveGenreFromAuthors < ActiveRecord::Migration
  def change
    remove_column :authors, :genre, :string
  end
end
