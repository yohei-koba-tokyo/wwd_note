class MemosController < ApplicationController
  def index
    @users = User.all
    @memos = MemoCollection.new
  end

  def create
    @memos = MemoCollection.new(memos_params)
    @memos.save
    redirect_to root_path
  end

  private
  def memos_params
    params.require(:memos).map{|memo| memo.permit(:memo).merge(user_id: current_user.id)}
  end

end
