# == Schema Information
#
# Table name: songs
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  artist      :string(255)
#  permalink   :string(255)
#  description :text
#  num_stars   :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Song < ActiveRecord::Base
  attr_accessible :title, :artist, :permalink, :description, :num_stars
  has_and_belongs_to_many :genres
  has_and_belongs_to_many :feelings
  before_destroy do
    genres.each do |genre|
      genre_check = GenresSongs.where(genre_id: genre)
      Genre.find(genre).destroy if genre_check.length == 1
      genre.destroy
    end
    feelings.each do |feeling|
      feeling_check = FeelingsSongs.where(feeling_id: feeling)
      Feeling.find(feeling).destroy if feeling_check.length == 1
      feeling.destroy
    end
  end
end
