class Api::RelationshipsController < ApplicationController


  # before_action :set_user

  def index
    @users = User.all.reject{|user| user == current_user}
    respond_to do |format|
      format.html { redirect_to :root }
      format.json
    end
  end

  def create
    @following = current_user.follow(@user)
    respond_to do |format|
      format.html
      format.json
    end

    # if following.save
    #   flash[:success] = 'ユーザーをフォローしました'
    #   redirect_to root_path
    # else
    #   flash.now[:alert] = 'ユーザーのフォローに失敗しました'
    #   redirect_to root_path
    # end
  end

  private
  def set_user
    @user = User.find(params[:relationship][:follow_id])
  end

end