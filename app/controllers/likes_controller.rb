class LikesController < ApplicationController

  def create
    Like.create like_params
    redirect_to "/bright_ideas"
  end

  private
  def like_params
    params.require(:like).permit(:bright_idea_id).merge(user: current_user)
  end

end
