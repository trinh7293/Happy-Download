module NotificationsHelper
  def noti notification
    product = Product.find_by id: notification.notificationable_id
    notification.notified_by.name + t(".has") + notification
      .notice_type + t(".in_your_product") + product.title
  end

  def noticlass notification
    notification.read == "read" ? "read" : "not-read"
  end

  def number
    user_signed_in? ? current_user.notifications.uncheck.count : 0
  end
end
