class SalesController < ApplicationController
  def index
    @order_details = current_user.sales.paginate page: params[:page]
    render "products/goodies"
  end
end
