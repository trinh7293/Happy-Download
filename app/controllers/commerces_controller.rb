class CommercesController < ApplicationController
  def index
    @title = params[:title]
    @order_details = current_user.send(@title).paginate page: params[:page],
      per_page: Settings.paginate.per_page
    render "products/goodies"
  end
end
