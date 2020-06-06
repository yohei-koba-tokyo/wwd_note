class MemosController < ApplicationController
  def index
    @users = User.all
    @memos = current_user.memos if user_signed_in?
    @memos_new = MemoCollection.new
  end

  def create
    @memos_new = MemoCollection.new(memos_params)
    @memos_new.save
    redirect_to root_path
  end

  private
  def memos_params
    params.require(:memos).map{|memo| memo.permit(:memo).merge(user_id: current_user.id)}
    # params.require(:memos).permit(:memo).merge(user_id: current_user.id)
  end

  


end
