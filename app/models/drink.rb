class Drink < ApplicationRecord
  belongs_to :user
  has_many :drink_tastes, dependent: :destroy
  has_many :tastes, through: :drink_tastes
  has_many :favorites, dependent: :destroy

  #お酒の画像をアップロードする
  has_one_attached :drink_image

  #ジャンルの選択ができる
  enum genre: { beer: 0, wine: 1, wiskey: 2, shouchu: 3, nihonnshu: 4, other: 5 }

  validates :brand, presence: true
  validates :genre, presence: true

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.search(params)
    drinks = all
    # もとの正しい記述(完全一致)
    # if params[:brand].present?
    #   drinks = drinks.where(brand: params[:brand])
    # end

    # 部分一致
    if params[:brand] == "partial_match"
      @drinks = Drink.where('brand like ?','%{params[:brand]}%')
    end
    # 部分一致終わり

    if params[:genres].present?
      drinks = drinks.where(genre: params[:genres])
    end
    if params[:taste_ids].present?
      drinks = drinks.joins(:drink_tastes).where(drink_tastes: { taste_id: params[:taste_ids] }).distinct
    end

    drinks
  end
end


    # #空欄検索
    #   if params[:search] == nil || ''
    #   @drinks= Drink.all
    # elsif params[:search] == ''
    #   @drinks= Drink.all
    # else
    #   #部分検索
    #   @drinks = Drink.where("brand LIKE ? ",'%' + params[:search] + '%')
    #   end


    #     if params[:brand].present? && params[:search].present?
    #   drinks = drinks.where("brand LIKE ?", '%' + params[:search] + '%')
    # elsif params[:brand].present?
    #   drinks = drinks.where(brand: params[:brand])
    # end