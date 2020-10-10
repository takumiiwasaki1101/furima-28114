class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  # FULL_WIDTH_KANA_REGEX = /^([ァ-ン]|ー)+$/i.freeze
  FULL_WIDTH_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/i.freeze

  validates_format_of :encrypted_password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'        
  validates :nickname,             presence: true
  validates :family_name,          presence: true
    validates_format_of :family_name, with: FULL_WIDTH_REGEX, message: 'Full-width characters'        
  validates :first_name,           presence: true
    validates_format_of :first_name, with: FULL_WIDTH_REGEX, message: 'Full-width characters'
  validates :family_name_furigana, presence: true
    # validates_format_of :family_name_furigana, with: FULL_WIDTH_KANA_REGEX, message: 'Full-width katakana characters'        
  validates :first_name_furigana,  presence: true
    # validates_format_of :first_name_furigana, with: FULL_WIDTH_KANA_REGEX, message: 'Full-width katakana characters'        
  validates :date_of_birth,        presence: true

  

end
