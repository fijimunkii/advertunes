class SongsController < ApplicationController

  def toggle
    song_to_toggle = Song.where(artist: params[:artist], permalink: params[:permalink])
    if song_to_toggle.length == 1
      song_to_toggle[0].destroy
      render json: { off: true }
    else
      if params[:genre] != "undefined"
        genre = Genre.where(name: params[:genre].titleize)
        if genre.length == 0
          genre = Genre.create(name: params[:genre].titleize)
        else
          genre = genre[0]
        end
      end
      #TODO genres_songs ????
      new_song = Song.new
      new_song.artist = params[:artist]
      new_song.title = params[:title]
      new_song.permalink = params[:permalink]
      new_song.description = params[:description]
      new_song.save!
      GenresSongs.create(genre: genre, song: new_song)
      render json: { on: true }
    end
  end

  def index
    client = Soundcloud.new(:client_id => ENV['ADVERTUNES_SOUNDCLOUD_ID'])
    songs = Song.all
    @song_frames = []
    songs.each do |song|
      has_user_star = false
      if current_user
        user_star_check = Star.where(song_id: song.id, user_id: current_user.id)
        has_user_star = user_star_check.length > 0
      end
      @song_frames << [client.get('/oembed', :url => "http://soundcloud.com/#{song.artist}/#{song.permalink}")['html'], song.id, song.num_stars, has_user_star]
    end
  end

  def feeling
    client = Soundcloud.new(:client_id => ENV['ADVERTUNES_SOUNDCLOUD_ID'])
    feeling = Feeling.where(name: params[:feeling])[0]
    songs = []
    songs_with_feeling = FeelingsSongs.where(feeling_id: feeling)
    songs_with_feeling.each do |feelings_songs|
      songs << Song.find(feelings_songs.song)
    end

    @song_frames = []
    songs.each do |song|
      has_user_star = false
      if current_user
        user_star_check = Star.where(song_id: song.id, user_id: current_user.id)
        has_user_star = user_star_check.length > 0
      end
      @song_frames << [client.get('/oembed', :url => "http://soundcloud.com/#{song.artist}/#{song.permalink}")['html'], song.id, song.num_stars, has_user_star]
    end
    render :index
  end

  def genre
    client = Soundcloud.new(:client_id => ENV['ADVERTUNES_SOUNDCLOUD_ID'])
    genre = Genre.where(name: params[:genre])[0]
    songs = []
    songs_with_genre = GenresSongs.where(genre_id: genre)
    songs_with_genre.each do |genres_songs|
      songs << Song.find(genres_songs.song)
    end

    @song_frames = []
    songs.each do |song|
      has_user_star = false
      if current_user
        user_star_check = Star.where(song_id: song.id, user_id: current_user.id)
        has_user_star = user_star_check.length > 0
      end
      @song_frames << [client.get('/oembed', :url => "http://soundcloud.com/#{song.artist}/#{song.permalink}")['html'], song.id, song.num_stars, has_user_star]
    end
    render :index
  end

  def top
    client = Soundcloud.new(:client_id => ENV['ADVERTUNES_SOUNDCLOUD_ID'])

    songs = Song.find(:all, :order => "num_stars DESC")

    @song_frames = []
    songs.each do |song|
      has_user_star = false
      if current_user
        user_star_check = Star.where(song_id: song.id, user_id: current_user.id)
        has_user_star = user_star_check.length > 0
      end
      @song_frames << [client.get('/oembed', :url => "http://soundcloud.com/#{song.artist}/#{song.permalink}")['html'], song.id, song.num_stars, has_user_star]
    end
    render :index
  end


  def bottom
    client = Soundcloud.new(:client_id => ENV['ADVERTUNES_SOUNDCLOUD_ID'])

    songs = Song.find(:all, :order => "num_stars ASC")

    @song_frames = []
    songs.each do |song|
      has_user_star = false
      if current_user
        user_star_check = Star.where(song_id: song.id, user_id: current_user.id)
        has_user_star = user_star_check.length > 0
      end
      @song_frames << [client.get('/oembed', :url => "http://soundcloud.com/#{song.artist}/#{song.permalink}")['html'], song.id, song.num_stars, has_user_star]
    end
    render :index
  end

end
