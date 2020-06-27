class Api::MemoformsController < ApplicationController
  protect_from_forgery

  def index
    todays_memos = Memo.where(created_at: Time.current.all_day, user_id: current_user.id)
    @todays_memos = MemoCollection.new(todays_memos) if todays_memos.exists?
    respond_to do |format|
      format.html
      format.json
    end
  end

  def update
    memo = Memo.find(params[:id])
    memo.update(memos_params)
  end

  private

  def memos_params
    params.permit(:memo)
  end


end