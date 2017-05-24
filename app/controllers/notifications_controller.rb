class NotificationsController < ApplicationController
  before_action :find_notification, only: [:show, :update]

  def show
    @noti.read!
    product = Product.find_by id: @noti.notificationable_id
    respond_to do |format|
      format.html{redirect_to product}
    end
  end

  def index
    current_user.notifications.map(&:checked!)
    respond_to do |format|
      format.js
    end
  end

  private
  def find_notification
    @noti = Notification.find_by id: params[:id]
    redirect_to root_url, notice: t(".not_found") unless @noti
  end
end
