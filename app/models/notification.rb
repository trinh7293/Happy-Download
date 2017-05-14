class Notification < ApplicationRecord
  belongs_to :notifier, class_name: User.name, foreign_key: "notifier_id"
  belongs_to :notifiee, class_name: User.name, foreign_key: "notifiee_id"
end
