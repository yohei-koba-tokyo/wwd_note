class Api::CommentsController < ApplicationController
  protect_from_forgery
  def create
    @comment = Comment.new(comment_params)
    @comment.save
  end
  
  def destroy
    @comment = Comment.find(params[:id])
  end

  private

  def comment_params
    
  end


end
