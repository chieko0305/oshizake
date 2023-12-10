class User < ApplicationRecord
  scope :publics, -> { where(status: 'released') }
  scope :not_publics, -> { where.not(status: 'released') }

  has_many :drinks
  has_many :favorites, dependent: :destroy
  # フォローをした、されたの関係
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # 一覧画面で使う
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #ユーザーのプロフィール画像をアップロードする
  has_one_attached :profile_image
  #お酒の画像をアップロードする
  has_one_attached :drink_image

  enum status: { nonreleased: 0, released: 1 }

  # フォローしたときの処理
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end
  # フォローを外すときの処理
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end
  # フォローしているか判定
  def following?(user)
    followings.include?(user)
  end

  # ゲストユーザー
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.password_confirmation = user.password
      user.name = "ゲストユーザー"
    end
  end

  # ユーザー名のバリデーション
  VALID_NAME_REGEX = /\A[a-zA-Z0-9]+\z/ # 半角英数字のみ受け付けるようにする
  validates :name, presence: true, uniqueness: { case_sensitive: false },
                                   length: { maximum: 30 },
                                   format: { with: VALID_NAME_REGEX },
                                   if: :require_validation?
                                   # ↑ guestがtrueの場合のみ、バリデーションを除外する

private

  def require_validation?
        return true if self.guest == false || self.guest == 0
        false
  end

end
