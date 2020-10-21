class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: EMAIL_REGEX }
  PASSWORD_REGEX = /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/
  validates :password, presence: true, length: { minimum: 6 }, format: { with: PASSWORD_REGEX }
  validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :family_furigana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_furigana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday, presence: true
end
