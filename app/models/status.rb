class Status < ActiveHash::Base
  self.data = [
    {id: 1, name: '新品・未使用'}, {id: 2, name: ''}, {id: 3, name: ''},
    {id: 4, name: ''}, {id: 5, name: ''}, {id: 6, name: ''},
    {id: 7, name: ''}, {id: 8, name: ''}, {id: 9, name: ''},
]
include ActiveHash::Associations
has_many :items
end
