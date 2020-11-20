require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it "ニックネーム、姓、名、姓カナ、名カナ、生年月日、メール、パスワードがある場合、有効である" do
      user = FactoryBot.build(:user)

      user.valid?
    end

    it "ニックネームがない場合、無効である" do
      user = FactoryBot.build(:user)
      user.nickname = ""

      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "姓がない場合、無効である" do
      user = FactoryBot.build(:user)
      user.family_name = ""
      user.valid?
      # binding.pry
      expect(user.errors.full_messages).to include("Family name can't be blank")
    end

    it "名がない場合、無効である" do
      user = FactoryBot.build(:user)
      user.first_name = ""

      user.valid?
      # binding.pry
      expect(user.errors.full_messages).to include("First name can't be blank")
    end

    it "姓カナがない場合、無効である" do
      user = FactoryBot.build(:user)
      user.family_name_kana = ""

      user.valid?
      # binding.pry
      expect(user.errors.full_messages).to include("Family name kana can't be blank")
    end

    it "名カナがない場合、無効である" do
      user = FactoryBot.build(:user)
      user.first_name_kana = ""

      user.valid?
      # binding.pry
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "生年月日がない場合、無効である" do
      user = FactoryBot.build(:user)
      user.birth_day = ""

      user.valid?
      # binding.pry
      expect(user.errors.full_messages).to include("Birth day can't be blank")
    end

    it "メールアドレスがない場合、無効である" do
      user = FactoryBot.build(:user)
      user.email = ""

      user.valid?
      # binding.pry
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it "パスワードがない場合、無効である" do
      user = FactoryBot.build(:user)
      user.password = ""

      user.valid?
      # binding.pry
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
  end
end
