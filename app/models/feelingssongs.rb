class FeelingsSongs < ActiveRecord::Base
  belongs_to :feeling
  belongs_to :song
end
