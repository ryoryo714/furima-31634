require 'rails_helper'

RSpec.describe User, type: :model do
  
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "ニックネーム、姓、名、姓カナ、名カナ、生年月日、メール、パスワードがある場合、有効である" do
        user = FactoryBot.build(:user)

        user.valid?
      end
    end
    context '新規登録がうまくいかないとき' do
      it "ニックネームがない場合、無効である" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "姓がない場合、無効である" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it "名がない場合、無効である" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "姓カナがない場合、無効である" do
        @user.family_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end

      it "名カナがない場合、無効である" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it "生年月日がない場合、無効である" do
        @user.birth_day = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end

      it "メールアドレスがない場合、無効である" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "メールアドレスが重複してる場合、無効である" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "emailが＠を含むこと" do
        @user.email = 'userexample.com'
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include("Email is invalid")
      
      end

      it "パスワードがない場合、無効である" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "パスワード(確認)がない場合、無効である" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "passwordが６文字以上でないと登録できない" do
        @user.password = "r1111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password",
          "Password is too short (minimum is 6 characters)",
          "Password is too short (minimum is 6 characters)",
          "Password is invalid")
      end

      it "passwordが英語のみでは登録できない" do
        @user.password = "aaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
      end

      it "passwordが数字のみでは登録できない" do
        @user.password = "111111"
        @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
      end

      it "passwordが全角では登録できない" do
        @user.password = "ああああああ"
        @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
      end

      it "family_nameが漢字・平仮名・カタカナ以外では登録できない" do
        @user.family_name = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end

      it "first_nameが漢字・平仮名・カタカナ以外では登録できない" do
        @user.first_name = "111111"
        @user.valid?

        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it "family_name_kanaが漢字・平仮名・カタカナ以外では登録できない" do
        @user.family_name_kana = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid")
      end

      it "first_name_kanaが漢字・平仮名・カタカナ以外では登録できない" do
        @user.first_name_kana = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

    end
  end
end
