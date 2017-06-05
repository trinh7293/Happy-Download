
class NotificationService
  def initialize params
    @action = params[:action]
    @notice_type = params[:notice_type]
    @current_user = params[:current_user]
  end

  def create_notification
    return if @action.product.user == @current_user
    noti = @action.product.notifications
      .create! user_id: @action.product.user_id,
        notified_by_id: @current_user.id, notice_type: @notice_type
    NotificationBroadcastJob.perform_later @action.product.user
      .notifications.uncheck.count, noti
  end
end
