class CreatePublicHolidays < ActiveRecord::Migration
  def change
    create_table :public_holidays do |t|
      t.string :date
      t.string :localname
      t.string :englishname
      t.text :image
      t.text :description

      t.timestamps
    end
  end
end
