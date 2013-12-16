class GenresSongs < ActiveRecord::Migration
  def change
    create_table :genres_songs, :id => false do |t|
      t.references :genre
      t.references :song
    end
    add_index :genres_songs, [:genre_id, :song_id]
    add_index :genres_songs, :song_id
  end
end
