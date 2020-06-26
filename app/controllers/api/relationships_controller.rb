class Api::RelationshipsController < ApplicationController
  protect_from_forgery

  # before_action :set_user, only: [:create]

  def index
    users = User.all.reject{|user| user == current_user}
    @users_pack = users.map{|user| [user, current_user.following?(user)]}
    @current_user = current_user.id
    respond_to do |format|
      format.html { redirect_to :root }
      format.json
    end
  end

  def create
    relation = Relationship.new(follow_params)
    if relation.save
      flash[:success] = 'ユーザーをフォローしました'
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
    end
    @user = [User.find(relation.follow_id), relation.id]
    @current_user = relation.user_id
    respond_to do |format|
      format.json
    end
  end

  def destroy
    relation = Relationship.find(params[:id])
    @user = [User.find(relation.follow_id), relation.id]
    @current_user = relation.user_id
    respond_to do |format|
      format.json
    end
    if relation.destroy
      flash[:success] = 'ユーザーのフォローを解除しました'
    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
    end
  end

  private
  # def set_user
  #   @user = User.find(params[:relationship][:follow_id])
  # end

  def follow_params
    params.permit(:user_id, :follow_id)
  end

end




# class RelationshipsController < ApplicationController
#   before_action :set_user

#   def create
#     following = current_user.follow(@user)
#     if following.save
#       flash[:success] = 'ユーザーをフォローしました'
#       redirect_to root_path
#     else
#       flash.now[:alert] = 'ユーザーのフォローに失敗しました'
#       redirect_to root_path
#     end
#   end

#   def destroy
#     following = current_user.unfollow(@user)
#     if following.destroy
#       flash[:success] = 'ユーザーのフォローを解除しました'
#       redirect_to root_path
#     else
#       flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
#       redirect_to root_path
#     end
#   end

#   private
#   def set_user
#     @user = User.find(params[:relationship][:follow_id])
#     # @user = User.find params[:follow_id]
#   end

# end
