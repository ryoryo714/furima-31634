class Status < ActiveHash::Base
  self.data = [
    {id: 1, name: '新品・未使用'}, {id: 2, name: '未使用に近い'}, {id: 3, name: '傷・汚れあり'},
    {id: 4, name: '全体的に状態がわるい'}
]
include ActiveHash::Associations
has_many :items
end
