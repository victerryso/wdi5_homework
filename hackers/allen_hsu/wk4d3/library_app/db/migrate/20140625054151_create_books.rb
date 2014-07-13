class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.integer :pages
      t.string :isbn
      t.string :image

      t.timestamps
    end
  end
end
