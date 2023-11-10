class DrinksController < ApplicationController
  def index
    @drink = Drink.new
    @tastes = Taste.all
    @drinks = Drink.search(params).page(params[:page])
    @user = current_user
    # @ranked_drinks = Drink.all
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
    @drink = Drink.find(params[:id])
    @user = @drink.user #この投稿をしたユーザー
    @tastes = Taste.all
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
    params.require(:drink).permit(:brand, :genre, :text, taste_ids: [])
  end
end