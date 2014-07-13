class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.string :birth_place
      t.date :dob
      t.text :image
      t.timestamps
    end
  end
end
