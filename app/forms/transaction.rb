class Transaction
  include ActiveModel::Model
  attr_accessor :token, :price, :user_id, :item_id, :postal_code, :prefecture_id, :city, :block, :building, :telephone_number, :order_id

  # Validation
  ## 入力必須に関するvalidation
  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id
    validates :city
    validates :block
    validates :telephone_number, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  end

  ## id0以外での入力を必須とするvalidation
  with_options numericality: { other_than: 0, message: 'Select' } do
    validates :prefecture_id
  end

  def save
    # オーダー情報の保存
    order = Order.create(user_id: user_id, item_id: item_id)
    # 配送先住所の保存
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block: block, building: building, telephone_number: telephone_number, order_id: order.id)
  end
end
