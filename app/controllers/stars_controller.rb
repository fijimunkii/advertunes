class StarsController < ApplicationController

  def toggle
    star_to_toggle = Star.where(user_id: current_user.id, song_id: params[:song_id])
    if star_to_toggle.length == 1
      star_to_toggle[0].destroy

      song_to_downvote = Song.find(params[:song_id])
      song_to_downvote.num_stars -= 1
      song_to_downvote.save!

      render json: { off: true }
    else
      new_star = Star.new
      new_star.user_id = current_user.id
      new_star.song_id = params[:song_id]
      new_star.save!

      song_to_upvote = Song.find(params[:song_id])
      song_to_upvote.num_stars += 1
      song_to_upvote.save!

      render json: { on: true }
    end
  end

end
