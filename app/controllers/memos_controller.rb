class MemosController < ApplicationController

  before_action :todays_memos, only: [:index, :update]

  def index
    @users = User.all
    @memos = MemoCollection.new
    @all_memos = current_user.memos if user_signed_in? 
    # @weekly_memos = current_user.get_weekly_memos(memos_index = 0) if user_signed_in?
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

  def todays_memos
    if user_signed_in?
      todays_memos = Memo.where(created_at: Time.current.all_day, user_id: current_user.id)
      @todays_memos = MemoCollection.new(todays_memos) if todays_memos.exists?
    end
  end
  
end
