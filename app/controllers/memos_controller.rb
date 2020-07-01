class MemosController < ApplicationController

  def index
  end

  def pagenation
    memos =current_user.memos.includes(:note).group_by {|i| i.created_at.to_date}.sort
    @memos = []
    (memos.first[0] .. (Date.today-1)).reverse_each do |date|
      memo = memos.find{|ary| ary[0] == date}
      memo.nil? ? memo = [] : memo = memo[1]
      memo.map!{|m| [m, m.note]}
      @memos << [date, memo]
    end
    respond_to do |format|
      format.html
      format.json
    end
  end

  def timeline
    @notes = Note.all.reverse
    respond_to do |format|
      format.json
    end
  end

  private
  def memos_params
    params.require(:memos).map{|memo| memo.permit(:memo).merge(user_id: current_user.id)}
  end
  
end
