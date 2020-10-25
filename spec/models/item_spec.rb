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

        it 'cost_burden_idが空では登録できないこと' do
          @item.cost_burden_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Cost burden can't be blank")
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

      # idが0の場合は登録できないことを確認
      it 'category_idが0では登録できないこと' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end

      it 'status_idが0では登録できないこと' do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Status Select")
      end

      it 'cost_burden_idが0では登録できないこと' do
        @item.cost_burden_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost burden Select")
      end

      it 'ship_from_idが0では登録できないこと' do
        @item.ship_from_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship from Select")
      end

      it 'shipping_day_idが0では登録できないこと' do
        @item.shipping_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day Select")
      end

      it 'priceが空では登録できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      # idが0の場合は登録できないことを確認

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