require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品登録' do
    context '商品登録がうまくいくとき' do
      it "商品名、出品画像、商品の説明、価格、カテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数がある場合" do
        item = FactoryBot.build(:item)

        item.valid?
      end
    end
    context '商品登録がうまくいかないとき' do
      it "商品名がない場合" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      
      it "商品の説明がない場合" do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it "価格がない場合" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end  

      it "カテゴリーがない場合" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "商品の状態がない場合" do
        @item.status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it "配送料の負担がない場合" do
        @item.shipping_cost_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
      end

      it "発送元の地域がない場合" do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "発送までの日数がない場合" do
        @item.shipping_day_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
    end
  end
end
