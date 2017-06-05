class NotificationBroadcastJob < ApplicationJob
  queue_as :default

  def perform number, notification
    ActionCable.server
      .broadcast "notification_#{notification.user_id}_channel",
        number: render_number(number),
        notification: render_notification(notification)
  end

  private
  def render_number number
    ApplicationController.renderer.render(partial: "layouts/number",
      locals: {number: number})
  end

  def render_notification notification
    ApplicationController.renderer.render(partial:
      "notifications/notification",
      locals: {notification: notification})
  end
end
