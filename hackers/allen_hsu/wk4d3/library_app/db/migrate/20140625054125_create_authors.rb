class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.string :nationality
      t.datetime :dob
      t.string :image

      t.timestamps
    end
  end
end
