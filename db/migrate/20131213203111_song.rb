class Song < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.string :artist
      t.string :permalink
      t.text :description
      t.integer :num_stars

      t.timestamps
    end
  end
end
