class MemosController < ApplicationController
  def index
    @users = User.all
    @memos = current_user.memos if user_signed_in?
    @memo = Memo.new
  end

  def create
    Memo.create(memo_params)
    # logger.debug Memo.create(memo_params).errors.inspect
    redirect_to root_path
  end

  private
  def memo_params
    params.require(:memo).permit(:memo).merge(user_id: current_user.id)
  end

  


end
