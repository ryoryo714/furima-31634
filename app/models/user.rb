class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birth_day

    with_options format: {with: /\A[ぁ-んァ-ン一-龥]/} do
      validates :family_name
      validates :first_name
    end
    with_options format: {with: /\A[ァ-ン]/} do
      validates :family_name_kana
      validates :first_name_kana
    end
  end

  

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])\w{6,}\z/
  validates :password, presence: true, length: { minimum: 6},format: { with: VALID_PASSWORD_REGEX}

  has_many :items
  has_many :purchase_records
end

