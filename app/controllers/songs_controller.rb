class SongsController < ApplicationController

  def toggle
    song_to_toggle = Song.where(artist: params[:artist], permalink: params[:permalink])
    if song_to_toggle.length == 1
      song_to_toggle[0].destroy
      render json: { off: true }
    else
      genre = Genre.where(name: params[:genre]).first_or_initialize.tap do |genre|
        genre.name = params[:genre]
        genre.save!
      end
      #TODO genres_songs ????
      new_song = Song.new
      new_song.artist = params[:artist]
      new_song.title = params[:title]
      new_song.permalink = params[:permalink]
      new_song.description = params[:description]
      new_song.save!
      render json: { on: true }
    end
  end

  def index
    client = Soundcloud.new(:client_id => ENV['ADVERTUNES_SOUNDCLOUD_ID'])
    songs = Song.all
    @song_frames = []
    songs.each do |song|
      @song_frames << client.get('/oembed', :url => "http://soundcloud.com/#{song.artist}/#{song.permalink}")['html']
    end
  end

end
