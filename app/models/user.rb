# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  email            :string(255)
#  password_digest  :string(255)
#  sc_id            :string(255)
#  sc_username      :string(255)
#  sc_access_token  :string(255)
#  sc_refresh_token :string(255)
#  sc_expires_at    :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class User < ActiveRecord::Base
  def self.soundcloud_client(options={})
    options = {
      :client_id     => ENV['ADVERTUNES_SOUNDCLOUD_ID'],
      :client_secret => ENV['ADVERTUNES_SOUNDCLOUD_SECRET'],
    }.merge(options)

    Soundcloud.new(options)
  end


  def soundcloud_client(options={})
    options= {
      :expires_at    => soundcloud_expires_at,
      :access_token  => soundcloud_access_token,
      :refresh_token => soundcloud_refresh_token
    }.merge(options)

    client = self.class.soundcloud_client(options)

    # define a callback for successful token exchanges
    # this will make sure that new access_tokens are persisted once an existing
    # access_token expired and a new one was retrieved from the soundcloud api
    client.on_exchange_token do
      self.update_attributes!({
        :soundcloud_access_token  => client.access_token,
        :soundcloud_refresh_token => client.refresh_token,
        :soundcloud_expires_at    => client.expires_at,
      })
    end

    client
  end
end
