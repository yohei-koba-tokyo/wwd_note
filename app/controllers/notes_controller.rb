class NotesController < ApplicationController

  def new
    user = current_user
    @memo = Memo.find(params[:format])
    @memos = user.memos.reverse
    @note = Note.new
    @feelings = Feeling.all
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def note_params
    params.require(:note).permit(:memo_id, :what, :why, :feeling_detail, :challenge, feeling_ids: []).merge(user_id: current_user.id)
  end

end
