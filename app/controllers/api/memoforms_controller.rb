class Api::MemoformsController < ApplicationController
  protect_from_forgery
  skip_before_action :verify_authenticity_token

  def index
    todays_memos = Memo.where(created_at: Time.current.all_day, user_id: current_user.id)
    todays_memos.exists? ? @todays_memos = MemoCollection.new(todays_memos) : @todays_memos = MemoCollection.new
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @todays_memos = MemoCollection.new(memos_params)
    @todays_memos.save
    respond_to do |format|
      format.html
      format.json
    end
  end

  def update
    memo = Memo.find(params[:id])
    memo.update(memo_params)
  end

  private

  def memos_params
    params.require(:memos).map{|memo| memo.permit(:memo).merge(user_id: current_user.id)}
  end

  def memo_params
    params.permit(:memo)
  end


end