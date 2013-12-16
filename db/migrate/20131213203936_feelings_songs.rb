class FeelingsSongs < ActiveRecord::Migration
  def change
    create_table :feelings_songs, :id => false do |t|
      t.references :feeling
      t.references :song
    end
    add_index :feelings_songs, [:feeling_id, :song_id]
    add_index :feelings_songs, :song_id
  end
end
