# == Schema Information
#
# Table name: registrations
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Registration < ActiveRecord::Base
  attr_accessible :email
end
