class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :order_details
  has_many :orders, through: :order_details
  has_many :wish_lists, dependent: :destroy
  has_many :feedbacks, dependent: :destroy
end
