class User < ApplicationRecord
  ratyrate_rater

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  has_one :profile, dependent: :destroy
  has_many :wish_lists, dependent: :destroy
  has_many :feedbacks, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :notifications_as_notifier, class_name: Notification.name,
    foreign_key: "notifier_id"
  has_many :notifications_as_notifiee, class_name: Notification.name,
    foreign_key: "notifiee_id"
  has_many :order_details, dependent: :destroy
  has_many :sales, class_name: OrderDetail.name, foreign_key: "seller_id"
  has_many :purchases, class_name: OrderDetail.name, foreign_key: "buyer_id"
end
