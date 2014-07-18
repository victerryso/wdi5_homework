class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.text :image
      t.integer :user_id

      t.timestamps
    end
  end
end
