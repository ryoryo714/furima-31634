class Category < ActiveHash::Base
  self.data = [
    {id: 1, name: 'レディース'}, {id: 2, name: 'メンズ'}, {id: 3, name: 'ベビー・キッズ'},
    {id: 4, name: 'インテリア'}, {id: 5, name: '本・音楽・ゲーム'}, {id: 6, name: 'おもちゃ'},
    {id: 7, name: '家電'}, {id: 8, name: 'スポーツ'}, {id: 9, name: 'その他'},
]
include ActiveHash::Associations
has_many :items
end
