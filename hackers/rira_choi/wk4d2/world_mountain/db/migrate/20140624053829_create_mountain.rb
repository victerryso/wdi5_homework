class CreateMountain < ActiveRecord::Migration
  def change
    create_table :mountains do |t|
      t.string :name
      t.text :image
      t.text :country
      t.text :Elevation
      t.text :range
      t.text :coordinates
      t.text :description

      t.timestamps
    end
  end
end
