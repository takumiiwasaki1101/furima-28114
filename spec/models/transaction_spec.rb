require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe '#create' do
    before do
      @transaction = FactoryBot.build(:transaction)
    end

    context '購入成功時' do
      it '全ての値が正しく入力されていれば購入ができること' do
        expect(@transaction).to be_valid
      end
    end

    context '購入失敗時' do
      # 空では登録できないことを確認
      it 'postal_codeが空では登録できないこと' do
        @transaction.postal_code = nil
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'prefecture_idが空では登録できないこと' do
        @transaction.prefecture_id = nil
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空では登録できないこと' do
        @transaction.city = nil
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("City can't be blank")
      end

      it 'blockが空では登録できないこと' do
        @transaction.block = nil
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Block can't be blank")
      end

      it 'telephone_numberが空では登録できないこと' do
        @transaction.telephone_number = nil
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Telephone number can't be blank")
      end
      # 空では登録できないことを確認

      # idが0の場合は登録できないことを確認
      it 'prefecture_idが0では登録できないこと' do
        @transaction.prefecture_id = 0
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include('Prefecture Select')
      end
      # idが0の場合は登録できないことを確認

      # 郵便番号にはハイフンが必要であること

    end
  end
end
