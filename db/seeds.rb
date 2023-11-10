# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# %W[ビール ワイン 焼酎 ウイスキー その他 ].each { |a| taste.create(name: a) }

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