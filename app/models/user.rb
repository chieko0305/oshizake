class User < ApplicationRecord
  has_many :drinks
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  #ユーザーのプロフィール画像をアップロードする
  has_one_attached :profile_image
  
  #お酒の画像をアップロードする
  has_one_attached :drink_image
  
end
