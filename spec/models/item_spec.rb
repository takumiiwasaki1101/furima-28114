require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.jpg')
    end

    context '新規登録成功時' do
      it 'image、name、detail、category_id、status_id、cost_burden_id、
          ship_burden_id、ship_from_id、shipping_day_id、priceが存在すれば登録できること' do
      expect(@item).to be_valid
      end
    end
  end
end

#       it 'passwordが6文字以上であれば登録できること' do
#         @user.password = 'T12345'
#         @user.password_confirmation = 'T12345'
#         expect(@user).to be_valid
#       end

#       it 'passwordが半角英数字混合であれば登録できること' do
#         @user.password = 'T123456'
#         @user.password_confirmation = 'T123456'
#         @user.valid?
#         expect(@user).to be_valid
#       end
#     end

#     context '新規登録失敗時' do
#       # 空では登録できないことを確認
#       it 'nicknameが空では登録できないこと' do
#         @user.nickname = nil
#         @user.valid?
#         expect(@user.errors.full_messages).to include("Nickname can't be blank")
#       end

#       it 'emailが空では登録できないこと' do
#         @user.email = nil
#         @user.valid?
#         expect(@user.errors.full_messages).to include("Email can't be blank")
#       end

#       it 'passwordが空では登録できないこと' do
#         @user.password = nil
#         @user.valid?
#         expect(@user.errors.full_messages).to include("Password can't be blank")
#       end

#       it 'family_nameが空では登録できないこと' do
#         @user.family_name = nil
#         @user.valid?
#         expect(@user.errors.full_messages).to include("Family name can't be blank")
#       end

#       it 'first_nameが空では登録できないこと' do
#         @user.first_name = nil
#         @user.valid?
#         expect(@user.errors.full_messages).to include("First name can't be blank")
#       end

#       it 'family_name_furiganaが空では登録できないこと' do
#         @user.family_name_furigana = nil
#         @user.valid?
#         expect(@user.errors.full_messages).to include("Family name furigana can't be blank")
#       end

#       it 'first_name_furiganaが空では登録できないこと' do
#         @user.first_name_furigana = nil
#         @user.valid?
#         expect(@user.errors.full_messages).to include("First name furigana can't be blank")
#       end

#       it 'date_of_birthが空では登録できないこと' do
#         @user.date_of_birth = nil
#         @user.valid?
#         expect(@user.errors.full_messages).to include("Date of birth can't be blank")
#       end
#       # /空では登録できないことを確認

#       # emailに@が存在しない場合登録できないことを確認
#       it 'emailに@が存在しない場合登録できないこと' do
#         @user.email = "hoge"
#         @user.valid?
#         expect(@user.errors.full_messages).to include('Email is invalid')
#       end
#       # /emailに@が存在しない場合登録できないことを確認

#       # 重複したemailが存在する場合登録できないことを確認
#       it '重複したemailが存在する場合登録できないこと' do
#         @user.save
#         another_user = FactoryBot.build(:user, email: @user.email)
#         another_user.valid?
#         expect(another_user.errors.full_messages).to include('Email has already been taken')
#       end
#       # /重複したemailが存在する場合登録できないことを確認
      
#       # パスワードの文字数制限を確認
#       it 'passwordが5文字以下であれば登録できないこと' do
#         @user.password = 'T1234'
#         @user.password_confirmation = 'T1234'
#         @user.valid?
#         expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
#       end
#       # /パスワードの文字数制限を確認

#       # パスワードの不一致の場合は登録できないことを確認
#       it 'passwordとpassword_confirmationが不一致では登録できないこと' do
#         @user.password = 'T12345'
#         @user.password_confirmation = 'T123456'
#         @user.valid?
#         expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
#       end
#       # パスワードの不一致の場合は登録できないことを確認

#       # パスワードは半角英数字混合が必須であることを確認
#       it 'passwordが半角数字のみであれば登録できないこと' do
#         @user.password = '123456'
#         @user.password_confirmation = '123456'
#         @user.valid?
#         expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
#       end

#       it 'passwordが半角英語のみであれば登録できないこと' do
#         @user.password = 'abcdef'
#         @user.password_confirmation = 'abcdef'
#         @user.valid?
#         expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
#       end
#       # /パスワードは半角英数字混合が必須であることを確認

#       # 名前は全角入力（漢字・ひらがな・カタカナ）が必須であることを確認
#       it 'family_nameが半角入力であれば登録できないこと' do
#         @user.family_name = 'ﾔﾏﾀﾞ'
#         @user.valid?
#         expect(@user.errors.full_messages).to include('Family name Full-width characters')
#       end

#       it 'first_nameが半角入力であれば登録できないこと' do
#         @user.first_name = 'ﾀﾛｳ'
#         @user.valid?
#         expect(@user.errors.full_messages).to include('First name Full-width characters')
#       end
#       # /名前は全角入力（漢字・ひらがな・カタカナ）が必須であることを確認

#       # フリガナは全角入力（カタカナ）が必須であることを確認
#       it 'family_name_furiganaが半角入力であれば登録できないこと' do
#         @user.family_name_furigana = 'ﾔﾏﾀﾞ'
#         @user.valid?
#         expect(@user.errors.full_messages).to include('Family name furigana Full-width katakana characters')
#       end

#       it 'family_name_furiganaが全角入力（漢字・ひらがな）であっても登録できないこと' do
#         @user.family_name_furigana = 'やま田'
#         @user.valid?
#         expect(@user.errors.full_messages).to include('Family name furigana Full-width katakana characters')
#       end

#       it 'first_name_furiganaが半角入力であれば登録できないこと' do
#         @user.first_name_furigana = 'ﾀﾛｳ'
#         @user.valid?
#         expect(@user.errors.full_messages).to include('First name furigana Full-width katakana characters')
#       end

#       it 'first_name_furiganaが全角入力（漢字・ひらがな）であっても登録できないこと' do
#         @user.first_name_furigana = 'た郎'
#         @user.valid?
#         expect(@user.errors.full_messages).to include('First name furigana Full-width katakana characters')
#       end
#       # フリガナは全角入力（カタカナ）が必須であることを確認
#     end
#   end
# end
