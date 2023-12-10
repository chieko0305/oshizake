class Relationship < ApplicationRecord
  validates_uniqueness_of :follower_id, scope: :followed_id
  # class_name: "User"でUserモデルを参照
  belongs_to :follower, class_name: "User"  #フォローしたユーザー
  belongs_to :followed, class_name: "User"  #フォローされたユーザー
end
