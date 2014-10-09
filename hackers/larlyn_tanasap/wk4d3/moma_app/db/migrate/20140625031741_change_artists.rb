class ChangeArtists < ActiveRecord::Migration
  change_table :artists do |t|
    t.rename :period, :movement
  end
end
