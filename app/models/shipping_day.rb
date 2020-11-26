class ShippingDay < ActiveHash::Base
  self.data = [
    {id: 1, name: '1日〜2日で発送'}, {id: 2, name: ''}, {id: 3, name: ''},
    {id: 4, name: ''}, {id: 5, name: ''}
]
include ActiveHash::Associations
has_many :items
end
