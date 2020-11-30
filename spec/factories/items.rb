FactoryBot.define do
  factory :item do
    name                  {"商品名"}
    price                 {1000}
    description           {"商品説明"}
    user_id   {11}
    category_id   {1}
    status_id   {1}
    shipping_cost_id  {1}
    prefecture_id   {1}
    shipping_day_id  {1}
    user

    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'public/images/test_image.png')) }
  end
end
