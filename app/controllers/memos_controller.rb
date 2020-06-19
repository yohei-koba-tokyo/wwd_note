class MemosController < ApplicationController

  before_action :todays_memos, only: [:index, :update]

  def index
    @users = User.all
    @memos = MemoCollection.new
  end

  def search
    memos =current_user.memos.group_by {|i| i.created_at.to_date}.sort
    @memos = []
    (memos.first[0] .. (Date.today-1)).reverse_each do |date|
      memo = memos.find{|ary| ary[0] == date}
      memo.nil? ? memo = [] : memo = memo[1]
      @memos << [date, memo]
    end
    respond_to do |format|
      format.html
      format.json
    end
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
