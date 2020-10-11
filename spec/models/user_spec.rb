require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nickname、email、password、password_confirmation、family_name、first_name、family_name_furigana、first_name_furigana、date_of_birthが存在すれば登録できること" do
      expect(@user).to be_valid
    end

    # 空では登録できないことを確認
    it "nicknameが空では登録できないこと" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank") 
    end

    it "emailが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank") 
    end

    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank") 
    end

    it "family_nameが空では登録できないこと" do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank") 
    end

    it "first_nameが空では登録できないこと" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank") 
    end

    it "family_name_furiganaが空では登録できないこと" do
      @user.family_name_furigana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name furigana can't be blank") 
    end

    it "first_name_furiganaが空では登録できないこと" do
      @user.first_name_furigana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name furigana can't be blank") 
    end

    it "date_of_birthが空では登録できないこと" do
      @user.date_of_birth = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Date of birth can't be blank") 
    end
    # /空では登録できないことを確認

    # パスワードの文字数制限を確認
    it "passwordが6文字以上であれば登録できること" do
      @user.password = "T12345"
      @user.password_confirmation = "T12345"
      expect(@user).to be_valid
    end

    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "T1234"
      @user.password_confirmation = "T1234"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    # /パスワードの文字数制限を確認

    # パスワードを２回入力し一致を確認
    it "passwordとpassword_confirmationが不一致では登録できないこと" do
      @user.password = "T12345"
      @user.password_confirmation = "T123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    # /パスワードを２回入力し一致を確認

    # パスワードは半角英数字混合が必須であることを確認
    it "passwordが半角英数字混合であれば登録できること" do
      @user.password = "T123456"
      @user.password_confirmation = "T123456"
      @user.valid?
      expect(@user).to be_valid
    end

    it "passwordが半角数字のみであれば登録できないこと" do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
    end

    it "passwordが半角英語のみであれば登録できないこと" do
      @user.password = "abcdef"
      @user.password_confirmation = "abcdef"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
    end
    # /パスワードは半角英数字混合が必須であることを確認

    # 重複したemailが存在する場合登録できないことを確認
    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    # /重複したemailが存在する場合登録できないことを確認

  end
end
