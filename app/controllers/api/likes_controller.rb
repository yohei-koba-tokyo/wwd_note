class Api::LikesController < ApplicationController
  protect_from_forgery
  skip_before_action :verify_authenticity_token

  def create
    @like = Like.new(like_params)
    @like.save
  end
  
  def destroy
    @like = like.find(params[:id])
  end

  private

  def like_params
    params.require(:like).permit(:note_id).merge(user_id: current_user.id)
  end

end
