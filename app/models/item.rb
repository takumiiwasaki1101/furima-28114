class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :cost_burden
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_day
  
  # Association
  belongs_to :user
  has_one_attached :image

  # Validation
    ## 入力必須に関するvalidation  
    with_options presence: true do
      validates :image
      validates :name
      validates :detail
      validates :category_id
      validates :status_id
      validates :cost_burden_id
      validates :ship_from_id
      validates :shipping_day_id
      validates :price, numericality: {with: /\A[0-9]+\z/, message: "Half-width number"}
    end

    ## id0以外での入力を必須とするvalidation
    with_options numericality: { other_than: 0, message: "Select"}  do
      validates :category_id
      validates :status_id
      validates :cost_burden_id
      validates :ship_from_id
      validates :shipping_day_id
    end

    ## 価格範囲に関するvalidation
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range"} 
end