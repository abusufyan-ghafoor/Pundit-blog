class Product < ApplicationRecord
  paginates_per 6
  belongs_to :category
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :reviews
  has_many :order_details
  has_many :orders, :through => :order_details
  mount_uploaders :avatars, AvatarUploader
end
