class OrderDetail < ApplicationRecord
  belongs_to :product
  belongs_to :order
  belongs_to :buyer, class_name: User.name
  belongs_to :seller, class_name: User.name
end
