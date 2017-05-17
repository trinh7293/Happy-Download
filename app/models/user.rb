class User < ApplicationRecord
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
end
