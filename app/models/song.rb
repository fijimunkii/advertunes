# == Schema Information
#
# Table name: songs
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  artist      :string(255)
#  permalink   :string(255)
#  description :text
#  num_stars   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Song < ActiveRecord::Base
  attr_accessible :title, :artist, :permalink, :description, :num_stars
  has_and_belongs_to_many :genres
  has_and_belongs_to_many :feelings
end
