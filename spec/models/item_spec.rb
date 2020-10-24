require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.jpg')
    end

    context '新規登録成功時' do
      it 'image、name、detail、category_id、status_id、cost_burden_id、
          ship_from_id、shipping_day_id、priceが存在すれば登録できること' do
      expect(@item).to be_valid
      end
    end

    context '新規登録失敗時' do
      # 空では登録できないことを確認
        it 'imageが空では登録できないこと' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it 'nameが空では登録できないこと' do
          @item.name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end

        it 'detailが空では登録できないこと' do
          @item.detail = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Detail can't be blank")
        end

        it 'category_idが空では登録できないこと' do
          @item.category_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end

        it 'status_idが空では登録できないこと' do
          @item.status_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Status can't be blank")
        end

        it 'ship_from_idが空では登録できないこと' do
          @item.ship_from_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Ship from can't be blank")
        end

        it 'shipping_day_idが空では登録できないこと' do
          @item.shipping_day_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping day can't be blank")
        end

        it 'priceが空では登録できないこと' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
      # 空では登録できないことを確認

      # 範囲外の価格では登録できないことを確認
        it 'priceが¥300~¥9,999,999の間でないと登録できないこと' do
          @item.price = 200
          @item.valid?
          expect(@item.errors.full_messages).to include("Price Out of setting range")
        end
      # 範囲外の価格では登録できないことを確認

      # 販売価格は半角数字のみ保存可能であることを確認
        it 'priceはが全角数字だと保存できないこと' do
          @item.price = '３４００'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price Half-width number')
        end
      # 販売価格は半角数字のみ保存可能であることを確認
    end
  end
end



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
