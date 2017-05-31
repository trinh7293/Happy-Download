class NotificationsController < ApplicationController
  before_action :find_notification, only: :update

  def update
    @noti.read!
    product = Product.find_by id: @noti.notificationable_id
    redirect_to product
  end

  private
  def find_notification
    @noti = Notification.find_by id: params[:id]
    redirect_to root_url, notice: t(".not_found") unless @noti
  end
end
