module ProductsHelper
  def user_product
    current_user == @product.user
  end
end
