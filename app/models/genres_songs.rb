# == Schema Information
#
# Table name: genres_songs
#
#  genre_id :integer
#  song_id  :integer
#

class GenresSongs < ActiveRecord::Base
  attr_accessible :genre, :song
  belongs_to :genre
  belongs_to :song
end
