class Item < ApplicationRecord
  # Association
  belongs_to :user
  has_one_attached :image

  # Validation
  with_options presence: true do
    validates :name
    validates :detail
    validates :category_id, numericality: { other_than: 0}
    validates :status_id, numericality: { other_than: 0}
    validates :cost_burden_id, numericality: { other_than: 0}
    validates :ship_from_id, numericality: { other_than: 0}
    validates :shipping_day_id, numericality: { other_than: 0}
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
  end}
    validates :user_id
  end
end
