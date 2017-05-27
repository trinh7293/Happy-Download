class OrderDetailsController < ApplicationController
  before_action :authenticate_user!

  def new
    @order_detail = OrderDetail.new
    @product = Product.find_by id: params[:product_id]
  end

  def create
    @order_detail = OrderDetail.new order_detail_params
    if @order_detail.save
      redirect_to root_url, notice: t(".order_save_success")
    else
      render :new
    end
  end

  private

  def order_detail_params
    params.require(:order_detail).permit :note, :product_id, :seller_id,
      :buyer_id
  end
end
