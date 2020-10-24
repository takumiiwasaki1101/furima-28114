class Item < ApplicationRecord
  # Association
  belongs_to :user
  has_one_attached :image

  # Validation
    ## 入力必須に関するvalidation  
    with_options presence: true do
      validates :image
      validates :name
      validates :detail
      validates :category_id, numericality: { other_than: 0, message: "Select
        "}
      validates :status_id, numericality: { other_than: 0, message: "Select
        "}
      validates :cost_burden_id, numericality: { other_than: 0, message: "Select
        "}
      validates :ship_from_id, numericality: { other_than: 0, message: "Select
        "}
      validates :shipping_day_id, numericality: { other_than: 0, message: "Select
        "}
      validates :price
    end
    ## 価格範囲に関するvalidation
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range"}
    ## 文字制限に関するvalidation
    validates :price, format: {with: /\A[0-9]+\z/, message: "Half-width number"}
  end
