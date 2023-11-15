class Relationship < ApplicationRecord
  # class_name: "User"でUserモデルを参照
  belongs_to :follower, class_name: "User"  #フォローしたユーザー
  belongs_to :followed, class_name: "User"  #フォローされたユーザー
end
