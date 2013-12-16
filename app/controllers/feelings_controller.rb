class FeelingsController < ApplicationController

  def create
    feeling = Feeling.create(name: params[:feeling])
    song = Song.find(params[:song_id])
    FeelingsSongs.create(feeling: feeling, song: song)
    render json: { success: true }
  end

end
