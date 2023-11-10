class Taste < ApplicationRecord
  # belongs_to :drink
  has_many :drink_tastes,foreign_key: "taste_id"
  has_many :drinks, through: :drink_tastes, source: :drink
    enum taste: { 和食: 0, 洋食: 1, 中華:2, イタリアン:3, フレンチ:4, 韓国:5, 辛口:6, 甘口:7, フルーティ:8, コク:9, キレ:10 }

  def taste_type
    # taste_typeの実装
  end

end
