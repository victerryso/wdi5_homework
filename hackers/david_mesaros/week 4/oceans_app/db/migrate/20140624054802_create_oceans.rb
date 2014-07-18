class CreateOceans < ActiveRecord::Migration
  def change
    create_table :oceans do |t|
    	t.string :name
    	t.string :zone
    	t.text :image
    	t.float :depth
    	t.float :climate

    	t.timestamp
    end
  end
end
