class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :purchase_record

  with_options presence: true do
    validates :name
    validates :price, length: {minimum: 3, maxinum: 7},numericality: { only_integer: true,
      greater_than: 300, less_than: 10000000
      }, format: {with: /\A[0-9]+\z/}
    validates :description
    validates :category_id
    validates :status_id
    validates :shipping_cost_id
    validates :prefecture_id
    validates :shipping_day_id
    validates :image
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_cost
  belongs_to :shipping_day
end
