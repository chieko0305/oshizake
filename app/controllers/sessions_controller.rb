class SessionsController < ApplicationController
  def guest_sign_in
    user = User.find_by(email: 'guest@example.com') || User.create!(email: 'guest@example.com', password: 'password')
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  def create
    user = User.find_or_create_by(email: "guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲストユーザー"
    end
    session[:user_id] = user.id
    flash[:notice] = "ゲストユーザーとしてログインしました"
    redirect_to root_path
  end

  def login
    # ログイン処理などを追加
  end
end