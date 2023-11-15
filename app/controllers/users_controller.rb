class UsersController < ApplicationController
  def index
  @drinks = Drink.page(params[:page])
  @drink = Drink.new
  @user = current_user
  @users = User.page(params[:page])
  @tastes = Taste.all
  end

  def show
  @user = User.find(params[:id])
  @drink = Drink.new
  @Users = User.all
  @drinks = @user.drinks.page(params[:page])
  @tastes = Taste.all

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "プロフィールを更新しました"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end


  def mypage
    @user = current_user
    # @users = User.find(params[:user_id])
  # フォロー一覧
    @follow = @user.followings
  # フォロワー一覧
    @follower = @user.followers
    # いいね一覧
    @favorites = Favorite.where(user_id: @user.id)

  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, :status)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
