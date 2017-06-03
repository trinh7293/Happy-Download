module ProductsHelper
  def available_suggestion?
    @products.try(:suggestions) && @products.suggestions.any?
  end
end
