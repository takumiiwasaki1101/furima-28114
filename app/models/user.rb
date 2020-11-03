class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 正規表現を変数設定
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  FULL_WIDTH_KANA_REGEX = /\A[ァ-ン]+\z/i.freeze
  FULL_WIDTH_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/i.freeze

  with_options presence: true do
    validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'
    validates :nickname
    validates :family_name
    validates_format_of :family_name, with: FULL_WIDTH_REGEX, message: 'Full-width characters'
    validates :first_name
    validates_format_of :first_name, with: FULL_WIDTH_REGEX, message: 'Full-width characters'
    validates :family_name_furigana
    validates_format_of :family_name_furigana, with: FULL_WIDTH_KANA_REGEX, message: 'Full-width katakana characters'
    validates :first_name_furigana
    validates_format_of :first_name_furigana, with: FULL_WIDTH_KANA_REGEX, message: 'Full-width katakana characters'
    validates :date_of_birth
  end

  # Association
  has_many :items
  has_many :orders
end
