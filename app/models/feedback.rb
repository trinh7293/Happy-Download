class Feedback < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :content, presence: true,
    length: {maximum: Settings.feedback.maximum_length}
end
