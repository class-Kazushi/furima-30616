class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
    validates :email, uniqueness: true, format: { with: EMAIL_REGEX }
    PASSWORD_REGEX = /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/.freeze
    validates :password, length: { minimum: 6 }, format: { with: PASSWORD_REGEX }
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
    validates :family_furigana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :first_furigana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birthday
  end

  has_many :products
  has_many :purchase_records
end
