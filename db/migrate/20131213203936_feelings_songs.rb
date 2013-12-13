class FeelingsSongs < ActiveRecord::Migration
  def change
    create_table :feelings_songs do |t|
      t.integer :feeling_id
      t.integer :song_id

      t.timestamps
    end
  end
end
