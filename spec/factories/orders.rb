FactoryBot.define do
  factory :order do
    post_code { "000-0000" }
    prefecture_id { 2 }
    city { "横浜市" }
    address { "566-18" }
    building_name { "ビルの名前" }
    phone_number { "08043020930" }
    token { "tok_abcdefghijk00000000000000000" }
  end
end