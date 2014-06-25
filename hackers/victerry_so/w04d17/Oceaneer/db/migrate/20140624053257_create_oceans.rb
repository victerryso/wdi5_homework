class CreateOceans < ActiveRecord::Migration
  def change
    create_table :oceans do |t|
      t.string :name
      t.integer :area
      t.integer :depth
      t.string :location
      t.text :image
    end
  end
end
