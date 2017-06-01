class WishListsController < ApplicationController
  before_action :find_wishlist, only: :destroy

  def index
    @products = current_user.wish_products.paginate page: params[:page]
  end

  def create
    @product = Product.find_by id: params[:wish_list][:product_id]
    current_user.wish_products << @product
    respond_to do |format|
      format.html{redirect_to @product}
      format.js
    end
  end

  def destroy
    @product = @wishlist.product
    current_user.wish_products.destroy @product
    respond_to do |format|
      format.html{redirect_to @product}
      format.js
    end
  end

  private
  def find_wishlist
    @wishlist = WishList.find_by id: params[:id]
    redirect_to root_url, notice: t(".not_found") unless @wishlist
  end
end
