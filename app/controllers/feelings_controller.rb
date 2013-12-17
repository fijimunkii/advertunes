class FeelingsController < ApplicationController

  # action for ajax call to add feeling to a song

  def create
    # looks for an existing feeling with the same name
    feeling_check = Feeling.where(name: params[:feeling])
    if feeling_check.length > 0
      feeling = feeling_check[0]
    else
      # creates the feeling if it doesn't exist
      feeling = Feeling.create(name: params[:feeling])
    end
    # creates the habtm relationship
    song = Song.find(params[:song_id])
    FeelingsSongs.create(feeling: feeling, song: song)

    render json: { success: true }
  end

end
