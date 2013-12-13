class GenresSongs < ActiveRecord::Migration
  def change
    create_table :genres_songs do |t|
      t.integer :genre_id
      t.integer :song_id

      t.timestamps
    end
  end
end
