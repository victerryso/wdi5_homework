class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.date :release
      t.string :genre
      t.integer :author_id
      t.integer :pages
      t.integer :ISBN
      t.text :image

      t.timestamps
    end
  end
end
