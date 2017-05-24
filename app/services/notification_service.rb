class NotificationService
  def initialize params
    @feedback = params[:feedback]
    @current_user_id = params[:current_user_id]
  end

  def create_notification
    current_user = User.find_by id: @current_user_id
    return if @feedback.product.user_id == current_user.id
    @feedback.product.notifications.create! user_id: @feedback.product.user_id,
      notified_by_id: @feedback.user_id, notice_type: "comment"
  end
end
