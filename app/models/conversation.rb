class Conversation < ApplicationRecord
  has_many :messages, dependent: :destroy

  belongs_to :sender, foreign_key: :sender_id, class_name: User.name
  belongs_to :recipient, foreign_key: :recipient_id, class_name: User.name

  validates :sender_id, uniqueness: {scope: :recipient_id}

  scope :between, (->(sender_id, recipient_id) do
    where(sender_id: sender_id, recipient_id: recipient_id).or(
      where(sender_id: recipient_id, recipient_id: sender_id)
    )
  end)

  class << self
    def find_sender_recipient sender_id, recipient_id
      conversation = between(sender_id, recipient_id).first
      return conversation if conversation.present?
      create(sender_id: sender_id, recipient_id: recipient_id)
    end
  end

  def opposed_user user
    is_recipient?(user) ? sender : recipient
  end

  def is_recipient? user
    user == recipient
  end
end
