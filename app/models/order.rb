class Order

  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :purchase_record, :phone_number, :user_id, :item_id, :token

  validates :post_code, format: {with: /\A\d{3}[-]\d{4}\z/}
  validates :phone_number, format: {with: /\A\d{11}\z/}

  with_options presence: true do
    validates :post_code
    validates :city
    validates :address
    validates :phone_number
    validates :token
  end

  def save
    purchase_record = PurchaseRecord.create!(item_id: item_id, user_id: user_id)
    Destination.create!(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, purchase_record_id: purchase_record.id, phone_number: phone_number)
  end
  
 end