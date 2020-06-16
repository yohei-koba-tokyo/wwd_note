class NotesController < ApplicationController

  def new
    user = current_user
    @memo = Memo.find(params[:format])
    @memos = user.memos.reverse
    @note = Note.new
    @feelings = Feeling.all
  end

  def create
    @note = Note.new
    
  end

end
