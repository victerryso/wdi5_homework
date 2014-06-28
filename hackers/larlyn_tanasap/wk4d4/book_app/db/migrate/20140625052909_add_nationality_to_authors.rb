class AddNationalityToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :nationality, :string
    add_column :authors, :image, :text
  end
end
