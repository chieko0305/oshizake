class Drink < ApplicationRecord
  belongs_to :user
  has_many :drink_tastes, dependent: :destroy
  has_many :tastes, through: :drink_tastes

  #お酒の画像をアップロードする
  has_one_attached :drink_image

  #ジャンルの選択ができる
  enum genre: { beer: 0, wine: 1, wiskey: 2, shouchu: 3, other: 4 }

  validates :brand, presence: true
  validates :genre, presence: true

  def self.search(params)
    drinks = all
    if params[:brand].present?
      drinks = drinks.where(brand: params[:brand])
    end
    if params[:genres].present?
      drinks = drinks.where(genre: params[:genres])
    end
    if params[:taste_ids].present?
      drinks = drinks.joins(:drink_tastes).where(drink_tastes: { taste_id: params[:taste_ids] }).distinct
    end

    drinks
  end
end
