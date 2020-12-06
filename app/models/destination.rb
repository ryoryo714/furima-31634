class Destination < ApplicationRecord
  belongs_to :purchase_record
  has_one :order
end
