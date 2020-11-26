class Category < ActiveHash::Base
  self.data = [
    {id: 1, name: 'レディース'}, {id: 2, name: 'メンズ'}, {id: 3, name: 'ベビー・キッズ'},
    {id: 4, name: 'インテリア'}, {id: 5, name: '本・音楽・ゲーム'}, {id: 6, name: ''},
    {id: 7, name: ''}, {id: 8, name: ''}, {id: 9, name: ''},
]
include ActiveHash::Associations
has_many :items
end
