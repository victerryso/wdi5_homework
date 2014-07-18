class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.integer :pages
      t.text :ISBN
      t.text :image
      t.timestamps
    end
  end
end
