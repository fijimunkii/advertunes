# == Schema Information
#
# Table name: feelings_songs
#
#  feeling_id :integer
#  song_id    :integer
#

class FeelingsSongs < ActiveRecord::Base
  attr_accessible :feeling, :song
  belongs_to :feeling
  belongs_to :song
end
