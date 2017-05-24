class Notification < ApplicationRecord
  belongs_to :notified_by, class_name: User.name
  belongs_to :user
  enum checked: [:false, :true]
end
