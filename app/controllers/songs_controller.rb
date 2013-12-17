class SongsController < ApplicationController

  before_filter :get_feelings, :get_genres

  def index
    songs = Song.all
    @song_frames = get_soundcloud_iframes(songs)
  end

  def feeling
    feeling = Feeling.where(name: params[:feeling])[0]
    songs = FeelingsSongs.where(feeling_id: feeling).map do |feelings_songs|
      Song.find(feelings_songs.song)
    end
    @song_frames = get_soundcloud_iframes(songs)
    render :index
  end

  def genre
    genre = Genre.where(name: params[:genre])[0]
    songs = GenresSongs.where(genre_id: genre).map do |genres_songs|
      Song.find(genres_songs.song)
    end
    @song_frames = get_soundcloud_iframes(songs)
    render :index
  end

  def top
    songs = Song.find(:all, :order => "num_stars DESC")
    @song_frames = get_soundcloud_iframes(songs)
    render :index
  end


  def bottom
    songs = Song.find(:all, :order => "num_stars ASC")
    @song_frames = get_soundcloud_iframes(songs)
    render :index
  end

  def single
    songs = Song.where(id: params[:id])
    @song_frames = get_soundcloud_iframes(songs)
    render :index
  end

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
      new_song = Song.create ({
        artist:      params[:artist],
        title:       params[:title],
        permalink:   params[:permalink],
        description: params[:description]
      })
      GenresSongs.create(genre: genre, song: new_song)
      render json: { on: true }
    end
  end

private

  def get_soundcloud_iframes(songs)
    client = Soundcloud.new(:client_id => ENV['ADVERTUNES_SOUNDCLOUD_ID'])

    song_frames = []

    songs.each do |song|
      has_user_star = false
      if current_user
        user_star_check = Star.where(song_id: song.id, user_id: current_user.id)
        has_user_star = user_star_check.length > 0
      end
      begin
      song_frames << [client.get('/oembed', :url => "http://soundcloud.com/#{song.artist}/#{song.permalink}")['html'], song.id, song.num_stars, has_user_star]
      rescue
        next
      end
    end
    song_frames
  end

  def get_feelings
    @feelings = Feeling.all.map do |feeling|
      feeling if FeelingsSongs.where(feeling_id: feeling).length > 0
    end
  end

  def get_genres
    @genres = Genre.all.map do |genre|
      genre if GenresSongs.where(genre_id: genre).length > 0
    end
  end

end
