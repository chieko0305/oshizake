class DrinksController < ApplicationController
  def index
    @drink = Drink.new
    @tastes = Taste.all
    @drinks = Drink.search(params).page(params[:page])
    @user = current_user
    @all_ranks = Drink.find(Favorite.group(:drink_id).order('count(drink_id) desc').limit(3).pluck(:drink_id))
  end

  def create
    @drink = current_user.drinks.new(drink_params)
    if @drink.save
      redirect_to drinks_path, notice: "お酒を投稿しました"
    else
      @tastes = Taste.all
      @drinks = Drink.all
      render :index
    end
  end

  def show
    @drink = Drink.new
    @drinks = Drink.find(params[:id])
    @tastes = Taste.all
    @user = @drinks.user #ドリンクを投稿したユーザー
  end

  def edit
    @drink = Drink.find(params[:id])
    @tastes = Taste.all
  end

  def update
    @drink = Drink.find(params[:id])
    if @drink.update(drink_params)
      flash[:notice] = "編集しました"
      redirect_to drink_path(@drink)
    else
      render :edit
    end
  end

  def destroy
    drink = Drink.find(params[:id])
    drink.destroy
    redirect_to '/drinks'
  end

  def search
    @tastes = Taste.all
  end

  private

  def drink_params
    params.require(:drink).permit(:drink_image, :brand, :genre, :text, taste_ids: [])
  end
end