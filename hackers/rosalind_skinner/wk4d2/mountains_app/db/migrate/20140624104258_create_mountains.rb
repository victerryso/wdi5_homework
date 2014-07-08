class CreateMountains < ActiveRecord::Migration
  def change
    create_table :mountains do |m|
      m.string :name
      m.text :location
      m.float :elevation
      m.text :range
      m.integer :first
      m.text :image

      m.timestamps
    end
  end
end
