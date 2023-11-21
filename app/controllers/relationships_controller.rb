class RelationshipsController < ApplicationController
# フォローするとき
  def create
    current_user.follow(params[:user_id])
    # redirect_to request.referer
    @user = User.find(params[:user_id])
    render "realtime_update"
  end
  # フォロー外すとき
  def destroy
    @user = User.find(params[:user_id])
    current_user.unfollow(params[:user_id])
    # redirect_to request.referer
    render "realtime_update"
  end
  # フォロー一覧
  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end
  # フォロワー一覧
  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end
end
