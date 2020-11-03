class Transaction

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture, :city, :block, :building, :telephone_number, :order_id

  # Validation
  ## 入力必須に関するvalidation
  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :block
    validates :telephone_number,numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  end

  ## id0以外での入力を必須とするvalidation
  with_options numericality: { other_than: 0, message: 'Select' } do
    validates :prefecture_id
  end

end