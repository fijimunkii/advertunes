class SoundcloudController < ApplicationController
  def connect
    redirect_to soundcloud_client.authorize_url(:display => "popup")
  end

  def connected
    if params[:error].nil?
      soundcloud_client.exchange_token(:code => params[:code])
      me = soundcloud_client.get("/me")

      cur_user = User.where(soundcloud_user_id: me.id).first_or_initialize.tap do |user|
        user.soundcloud_user_id = me.id
        user.soundcloud_username = me.username
        user.save!
      end

      login_as cur_user

      current_user.update_attributes!({
        :soundcloud_access_token  => soundcloud_client.access_token,
        :soundcloud_refresh_token => soundcloud_client.refresh_token,
        :soundcloud_expires_at    => soundcloud_client.expires_at,
      })
    end
    render :layout => false
  end

  def disconnect
    login_as nil
    redirect_to root_path
  end

  def music
    client = Soundcloud.new(:access_token => current_user.soundcloud_access_token)
    me = client.get("/me")
    @songs = client.get("/me/tracks").map do |song|
      song_check = Song.where(artist: me.username, permalink: song.permalink)
      on = song_check.length == 1 ? true : false
      {
        artist: me.username,
        title: song.title,
        permalink: song.permalink,
        genre: song.genre,
        description: song.description,
        on: on
      }
    end
  end

private

  def soundcloud_client
    return @soundcloud_client if @soundcloud_client
    @soundcloud_client = User.soundcloud_client(:redirect_uri  => soundcloud_connected_url)
  end


end
