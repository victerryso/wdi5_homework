class CreateLunarToSolar < ActiveRecord::Migration
  def change
    create_table :lunar_to_solars do |t|
      t.string :lunar_date
      t.string :solar_date
      t.integer :yun

      t.timestamps
    end
  end
end
