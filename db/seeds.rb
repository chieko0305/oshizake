# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# %W[ビール ワイン 焼酎 ウイスキー その他 ].each { |a| taste.create(name: a) }


# ユーザーデータ

tanaka_sakura = User.find_or_create_by!(email: "jimin@example.com") do |user|
  user.name = "田中さくら"
  user.password = "password"
  user.introduction = "日本酒が大好きです"
  # user.status = "1"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")
end

satou_misaki = User.find_or_create_by!(email: "mingi@example.com") do |user|
  user.name = "佐藤みさき"
  user.password = "password"
  user.introduction = "ウイスキー始めました"
  # user.status = "1"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")
end

nakamura_yuri = User.find_or_create_by!(email: "usik@example.com") do |user|
  user.name = "中村ゆり"
  user.password = "password"
  user.introduction = "ワインが一番好きなお酒です。最近はワインの勉強も頑張っています！"
  # user.status = "1"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")
end

kobayashi_haruka = User.find_or_create_by!(email: "kimata@example.com") do |user|
  user.name = "小林はるか"
  user.password = "password"
  user.introduction = "日本酒を熱燗で飲むのが大好きです"
  # user.status = "1"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.jpg"), filename:"sample-user4.jpg")
end

watanabe_marin = User.find_or_create_by!(email: "hasegawa@example.com") do |user|
  user.name = "渡辺まりん"
  user.password = "password"
  user.introduction = "お酒は何でも大好きです"
  # user.status = "1"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5.jpg"), filename:"sample-user5.jpg")
end

kato_yuko = User.find_or_create_by!(email: "dokugiri@example.com") do |user|
  user.name = "加藤ゆうこ"
  user.password = "password"
  user.introduction = "最近チャミスルにハマってます"
  # user.status = "1"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user6.jpg"), filename:"sample-user6.jpg")
end

yamada_kenji = User.find_or_create_by!(email: "donnsoku@example.com") do |user|
  user.name = "山田けんじ"
  user.password = "password"
  user.introduction = "お酒あまり強くないです"
  # user.status = "1"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user7.jpg"), filename:"sample-user7.jpg")
end

suzuki_taro = User.find_or_create_by!(email: "sadao@example.com") do |user|
  user.name = "鈴木たろう"
  user.password = "password"
  user.introduction = "お酒大好きです"
  # user.status = "1"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user8.jpg"), filename:"sample-user8.jpg")
end

ito_kazuya = User.find_or_create_by!(email: "asei@example.com") do |user|
  user.name = "伊藤かずや "
  user.password = "password"
  user.introduction = "ビールと日本酒が一番好きなお酒です"
  # user.status = "1"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user9.jpg"), filename:"sample-user9.jpg")
end

saito_koji= User.find_or_create_by!(email: "yazawa@example.com") do |user|
  user.name = "斉藤こうじ"
  user.password = "password"
  user.introduction = "ビールしか飲みません"
  # user.status = "1"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user10.jpg"), filename:"sample-user10.jpg")
end

tanaka_sakura.follow(satou_misaki.id)
tanaka_sakura.follow(saito_koji.id)
tanaka_sakura.follow(watanabe_marin.id)
tanaka_sakura.follow(suzuki_taro.id)
tanaka_sakura.follow(yamada_kenji.id)

satou_misaki.follow(saito_koji.id)
satou_misaki.follow(kato_yuko.id)
satou_misaki.follow(ito_kazuya.id)
satou_misaki.follow(suzuki_taro.id)

nakamura_yuri.follow(tanaka_sakura.id)
nakamura_yuri.follow(satou_misaki.id)
nakamura_yuri.follow(saito_koji.id)
nakamura_yuri.follow(ito_kazuya.id)
nakamura_yuri.follow(suzuki_taro.id)
nakamura_yuri.follow(yamada_kenji.id)
nakamura_yuri.follow(kato_yuko.id)

kobayashi_haruka.follow(satou_misaki.id)
kobayashi_haruka.follow(saito_koji.id)
kobayashi_haruka.follow(ito_kazuya.id)
kobayashi_haruka.follow(suzuki_taro.id)
kobayashi_haruka.follow(yamada_kenji.id)

watanabe_marin.follow(saito_koji.id)
watanabe_marin.follow(satou_misaki.id)
watanabe_marin.follow(ito_kazuya.id)

kato_yuko.follow(tanaka_sakura.id)
kato_yuko.follow(satou_misaki.id)
kato_yuko.follow(nakamura_yuri.id)
kato_yuko.follow(watanabe_marin.id)
kato_yuko.follow(kobayashi_haruka.id)
kato_yuko.follow(yamada_kenji.id)
kato_yuko.follow(suzuki_taro.id)
kato_yuko.follow(ito_kazuya.id)
kato_yuko.follow(saito_koji.id)

yamada_kenji.follow(tanaka_sakura.id)
yamada_kenji.follow(satou_misaki.id)
yamada_kenji.follow(watanabe_marin.id)
yamada_kenji.follow(kato_yuko.id)
yamada_kenji.follow(suzuki_taro.id)
yamada_kenji.follow(ito_kazuya.id)
yamada_kenji.follow(saito_koji.id)

suzuki_taro.follow(satou_misaki.id)
suzuki_taro.follow(saito_koji.id)
suzuki_taro.follow(ito_kazuya.id)

ito_kazuya.follow(tanaka_sakura.id)
ito_kazuya.follow(saito_koji.id)
ito_kazuya.follow(kato_yuko.id)
ito_kazuya.follow(watanabe_marin.id)
ito_kazuya.follow(nakamura_yuri.id)
ito_kazuya.follow(kobayashi_haruka.id)
ito_kazuya.follow(suzuki_taro.id)

saito_koji.follow(tanaka_sakura.id)
saito_koji.follow(satou_misaki.id)
saito_koji.follow(ito_kazuya.id)
saito_koji.follow(kato_yuko.id)
saito_koji.follow(watanabe_marin.id)


# # フォローするユーザーをまとめた配列
# followers = [tanaka_sakura, yamada_kenji, nakamura_yuri]
# # 配列の要素をループで処理してユーザー2をフォローする
# followers.each { |follower| follower.follow(tanaka_sakura.id) }



Drink.create!(
  [
    {drink_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-drink1.jpg"), filename:"sample-drink1.jpg"), brand:'十七代', text: 'おすすめの日本酒です。', genre: 'nihonnshu', user_id: 1 },
    {drink_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-drink2.jpg"), filename:"sample-drink2.jpg"), brand:'ジョニーウォーカー', text: 'ハイボールで飲むと美味しいです！', genre: 'wine', user_id: 2 },
    {drink_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-drink3.jpg"), filename:"sample-drink3.jpg"), brand:'カロンセギュール', text: '記念日におすすめ！', genre: 'wine', user_id: 3 },
    {drink_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-drink4.jpg"), filename:"sample-drink4.jpg"), brand:'越乃寒梅', text: '熱燗で飲むのが好きです！', genre: 'nihonnshu', user_id: 4 },
    {drink_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-drink5.jpg"), filename:"sample-drink5.jpg"), brand:'バイオレットフィズ', text: '好きなカクテルの一つです。', genre: 'other', user_id: 5 },
    {drink_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-drink6.jpg"), filename:"sample-drink6.jpg"), brand:'チョウムチョロム', text: '韓国料理にはこれです！', genre: 'other', user_id: 6 },
    {drink_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-drink7.jpg"), filename:"sample-drink7.jpg"), brand:'シャトームートン', text: '五代シャトー、お祝い事におすすめです！', genre: 'wine', user_id: 7 },
    {drink_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-drink8.jpg"), filename:"sample-drink8.jpg"), brand:'だいやめ', text: '香りが良いのでロックで飲むのがおすすめです。', genre: 'shouchu', user_id: 8 },
    {drink_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-drink9.jpg"), filename:"sample-drink9.jpg"), brand:'オールドパー', text: 'ロックで飲むのをおすすめします。', genre: 'wiskey', user_id: 9 },
    {drink_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-drink10.jpg"), filename:"sample-drink10.jpg"), brand:'キリンビール', text: '晩酌の定番です！', genre: 'beer', user_id: 10 },
  ]
)

Taste.create([
  { taste: '和食' },
  { taste: '洋食' },
  { taste: '中華' },
  { taste: 'イタリアン' },
  { taste: 'フレンチ' },
  { taste: '韓国' },
  { taste: '辛口' },
  { taste: '甘口' },
  { taste: 'フルーティ' },
  { taste: 'コク' },
  { taste: 'キレ' },
])


[1, 3, 4, 8].each do |i|
  DrinkTaste.create(taste_id: i, drink_id: 1)
end
[1, 2, 6].each do |i|
  DrinkTaste.create(taste_id: i, drink_id: 2)
end
[1, 3, 4, 7, 8].each do |i|
  DrinkTaste.create(taste_id: i, drink_id: 3)
end
[0, 7, 8].each do |i|
  DrinkTaste.create(taste_id: i, drink_id: 4)
end
[1, 3, 7, 8].each do |i|
  DrinkTaste.create(taste_id: i, drink_id: 5)
end
[5, 6].each do |i|
  DrinkTaste.create(taste_id: i, drink_id: 6)
end
[1, 3, 4, 6, 8].each do |i|
  DrinkTaste.create(taste_id: i, drink_id: 7)
end
[0, 2, 5, 7, 8].each do |i|
  DrinkTaste.create(taste_id: i, drink_id: 8)
end
[0, 1, 2, 3, 6].each do |i|
  DrinkTaste.create(taste_id: i, drink_id: 9)
end
[0, 1, 2, 9, 10].each do |i|
  DrinkTaste.create(taste_id: i, drink_id: 10)
end



[2, 4, 5, 6, 8].each do |i|
  Favorite.create(drink_id: i, user_id: 1)
end
[2, 4, 5, 6, 8].each do |i|
  Favorite.create(drink_id: i, user_id: 2)
end
[3, 5, 7, 9].each do |i|
  Favorite.create(drink_id: i, user_id: 3)
end
[1, 4, 6, 8, 9].each do |i|
  Favorite.create(drink_id: i, user_id: 4)
end
[1, 8, 9].each do |i|
  Favorite.create(drink_id: i, user_id: 5)
end
[1, 6, 10].each do |i|
  Favorite.create(drink_id: i, user_id: 6)
end
[1, 9, 10].each do |i|
  Favorite.create(drink_id: i, user_id: 7)
end
[1, 2, 6].each do |i|
  Favorite.create(drink_id: i, user_id: 8)
end
[1, 8, 9].each do |i|
  Favorite.create(drink_id: i, user_id: 9)
end
[1, 9].each do |i|
  Favorite.create(drink_id: i, user_id: 10)
end


