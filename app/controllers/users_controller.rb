class UsersController < ApplicationController
  def index
  @drinks = Drink.all
  @drink = Drink.new
  @user = current_user
  @users = User.all
  @tastes = Taste.all
  end

  def show
  @user = User.find(params[:id])
  @drink = Drink.new
  @Users = User.all
  @drinks = @user.drinks
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

  private

  def user_params
    params.require(:user).permit(:name, :introduction)
  end

end
