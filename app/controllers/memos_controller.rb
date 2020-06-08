class MemosController < ApplicationController

  before_action :todays_memos, only: [:index, :update]

  def index
    @users = User.all
    @memos = MemoCollection.new

  end

  def create
    @memos = MemoCollection.new(memos_params)
    @memos.save
    redirect_to root_path
  end

  def update
    @todays_memos.update(update_memos_params)
    redirect_to root_path
  end

  private
  def memos_params
    params.require(:memos).map{|memo| memo.permit(:memo).merge(user_id: current_user.id)}
  end

  def update_memos_params
    params.require(:memos).map{|memo| memo.permit(:id, :memo).merge(user_id: current_user.id)}
  end

  def todays_memos
    todays_memos = Memo.where(created_at: Time.current.all_day, user_id: current_user.id) if user_signed_in?
    @todays_memos = MemoCollection.new(todays_memos) if todays_memos.exists?
  end
  
end
