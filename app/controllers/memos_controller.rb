class MemosController < ApplicationController
  def index
    @users = User.all
    @memos = current_user.memos
  end
end
