class ManageProductsController < ApplicationController
  before_action :authenticate_user!
  def index
    @products = current_user.products.ordered
      .active.paginate page: params[:page]
  end
end
