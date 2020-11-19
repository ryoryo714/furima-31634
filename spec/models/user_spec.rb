require 'rails_helper'

RSpec.describe User, type: :model do

  it "姓、名、メール、パスワードがある場合、有効である"
     user = User.new(
     nickname: "nick",
     family_name: "山田",
     first_name: "太郎",
     family_name_kana: "ヤマダ",
     first_name_kana: "タロウ",
     birth_day: "1999-07-14",
     email: "testman@example.com",
     password: "pas111",
     )
     # オブジェクトをexpectに渡した時に、有効である(be valid)という意味になります
     expect(user).to be_valid
  end
  it "名がない場合、無効である"
  it "姓がない場合、無効である" 
  it "メールアドレスがない場合、無効である" 
  it "重複したメールアドレスの場合、無効である"
  it "パスワードがない場合、無効である"

end
