class FeelingsController < ApplicationController

  def create
    feeling_check = Feeling.where(name: params[:feeling])
    if feeling_check.length > 0
      feeling = feeling_check[0]
    else
      feeling = Feeling.create(name: params[:feeling])
    end
    song = Song.find(params[:song_id])
    FeelingsSongs.create(feeling: feeling, song: song)
    render json: { success: true }
  end

end
