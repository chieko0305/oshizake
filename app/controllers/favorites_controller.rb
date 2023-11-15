class FavoritesController < ApplicationController
  def create
    @drink = Drink.find(params[:drink_id])
    favorite = current_user.favorites.new(drink_id: @drink.id)
    favorite.save!
    # redirect_back(fallback_location: root_path) 非同期通信
  end

  def destroy
    @drink = Drink.find(params[:drink_id])
    favorite = current_user.favorites.find_by(drink_id: @drink.id)
    favorite.destroy!
    # redirect_back(fallback_location: root_path) 非同期通信
  end
end
