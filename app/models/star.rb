# == Schema Information
#
# Table name: stars
#
#  id         :integer          not null, primary key
#  song_id    :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Star < ActiveRecord::Base
  attr_accessible :song_id, :user_id
end
