class MountainsCreate < ActiveRecord::Migration
  def change
    create_table :mountains do |t|
      t.string :name
      t.text :image
      t.float :height
      t.integer :first_climb
      t.text :country

      t.timestamps
    end
  end
end
