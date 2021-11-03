class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :articles
  has_many :orders
  has_many :comments
  has_many :reviews
  has_many :products
  enum user_type: {
    moderator: 0,
    buyer: 1
  }
  validates :name, :phone, :user_type, presence: true
  validates :phone, length: { maximum: 10 }
  validates :phone, uniqueness: true
end
