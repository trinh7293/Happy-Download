class StaticPagesController < ApplicationController
  def show
    if valid_page?
      @products = Product.all if params[:page] == "home"
      render template: "static_pages/#{params[:page]}"
    else
      render file: "public/404.html", status: :not_found
    end
  end

  def manage_product
    @products = current_user.products
  end

  private
  def valid_page?
    File.exist? Pathname.new(Rails.root + "app/views/static_pages/#{params[:page]}.html.erb")
  end
end
