class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.date :dob
      t.string :genre
      t.string :period
      t.text :resting_place
      t.timestamps
    end
  end
end
