class PurchasesController < ApplicationController
  def index
    @order_details = current_user.purchases.paginate page: params[:page],
      per_page: 2
    render "products/goodies"
  end
end
