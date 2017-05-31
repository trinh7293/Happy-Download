module UsersHelper
  def user_product product
    current_user == product.user
  end

  def user_feedback feedback
    current_user == feedback.user
  end
end
