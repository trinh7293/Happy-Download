class NotificationsController < ApplicationController
  before_action :find_notification, only: :update
  def update
    @noti = Notification.find_by id: params[:id]
    @noti.update_attributes read: true
    product = Product.find_by(id: @noti.notificationable_id)
    redirect_to product
  end
  private
  def find_notification
    @noti = Notification.find_by id: params[:id]
  end
end
