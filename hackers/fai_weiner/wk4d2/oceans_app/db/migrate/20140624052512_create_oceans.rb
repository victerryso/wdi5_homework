class CreateOceans < ActiveRecord::Migration
  def change
    create_table :oceans do |t|
      t.string :name
      t.text :image
      t.integer :size
      t.text :continents
      t.integer :year_discovered
      t.string :nickname
      t.integer :percentage

      t.timestamps
    end
  end
end
