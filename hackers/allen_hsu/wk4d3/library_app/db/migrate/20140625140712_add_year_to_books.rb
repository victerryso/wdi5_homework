class AddYearToBooks < ActiveRecord::Migration
  def change
    add_column :books, :year, :integer
    add_column :books, :synopsis, :text
  end
end
