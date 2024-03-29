class DrinksController < ApplicationController
  def index
    @drink = Drink.new
    @tastes = Taste.all
    @drinks = Drink.publics.search(params).page(params[:page])
    @user = current_user
    @all_ranks = Drink.find(Favorite.group(:drink_id).order('count(drink_id) desc').limit(3).pluck(:drink_id))
  end

  def create
    @drink = current_user.drinks.new(drink_params)
    if @drink.save
      redirect_to drink_path(@drink), notice: "お酒を投稿しました"
    else
      @tastes = Taste.all
      @drinks = Drink.all
      render :index
    end
  end

  def show
    @new_drink = Drink.new
    @drink = Drink.find(params[:id])
    @tastes = Taste.all
    @user = @drink.user #ドリンクを投稿したユーザー
  end

  def edit
    @drink = Drink.find(params[:id])
    @tastes = Taste.all
    unless @drink.user == current_user
      redirect_to  drink_path(@drink)
    end
  end

  def update
    @drink = Drink.find(params[:id])
    if @drink.user != current_user
      redirect_to  new_post_path
    else
      if @drink.update(drink_params)
        flash[:notice] = "編集しました"
        redirect_to drink_path(@drink)
      else
      render :edit
      end
    end
  end

  def destroy
    drink = Drink.find(params[:id])
    if drink.user != current_user
      redirect_to  '/drinks'
    else
      drink.destroy
      redirect_to  '/drinks'
    end
  end

  def search
    @tastes = Taste.all
  end

  private

  def drink_params
    params.require(:drink).permit(:drink_image, :brand, :genre, :text, taste_ids: [])
  end
end