class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform message
    sender = message.user
    recipient = message.conversation.opposed_user sender
    broadcast_to_sender sender, message
    broadcast_to_recipient recipient, message
  end

  private
  def broadcast_to_sender user, message
    ActionCable.server.broadcast(
      "conversations-#{user.id}",
      message: render_message(message, user),
      conversation_id: message.conversation_id
    )
  end

  def broadcast_to_recipient user_recipient, message_recipient
    ActionCable.server.broadcast(
      "conversations-#{user_recipient.id}",
      window: render_window(message_recipient.conversation, user_recipient),
      message: render_message(message_recipient, user_recipient),
      conversation_id: message_recipient.conversation_id
    )
  end

  def render_message message_render, user_render
    ApplicationController.render(
      partial: "messages/message",
      locals: {message: message_render, user: user_render}
    )
  end

  def render_window conversation, user
    ApplicationController.render(
      partial: "conversations/conversation",
      locals: {conversation: conversation, user: user}
    )
  end
end
