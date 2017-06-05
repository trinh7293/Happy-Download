class Notification < ApplicationRecord
  belongs_to :notified_by, class_name: User.name
  belongs_to :user
  enum read: [:unread, :read]
  enum checked: [:uncheck, :checked]

  scope :ordered, (->{order created_at: :desc})
end
