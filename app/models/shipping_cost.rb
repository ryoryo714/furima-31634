class ShippingCost < ActiveHash::Base
  self.data = [
    {id: 1, name: '着払い'}, {id: 2, name: '送料込み'}
]
include ActiveHash::Associations
has_many :items
end
