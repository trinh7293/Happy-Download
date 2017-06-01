module WishListsHelper
  def wish
    current_user.wish_lists.new
  end

  def remove_wish
    remove_wish = current_user.wish_lists.find_by product_id: @product.id
    if remove_wish
      @remove_wish = remove_wish
    else
      redirect_to root_path, notice: t(".not_found")
    end
  end
end
