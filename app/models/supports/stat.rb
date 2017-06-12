class Supports::Stat
  attr_reader :stat
  attr_reader :step, :rp

  def initialize
  end

  def info_step
    1.day * 1000
  end

  def rp
    3.weeks.ago
  end

  def dt_sale current_user
    (rp.to_date..Date.today).map{|date| sale_on date, current_user}.inspect
  end

  def dt_order current_user
    (rp.to_date..Date.today).map{|date| order_on date, current_user}.inspect
  end

  def best_seller_user
    OrderDetail.best_seller_user
  end

  def best_seller_amount
    OrderDetail.best_seller_amount
  end

  def most_purchase_products
    OrderDetail.most_purchase_products
  end

  private
  def sale_on date, current_user
    current_user.sales.cash_on(date).sum(:price).to_f
  end

  def order_on date, current_user
    current_user.purchases.cash_on(date).sum(:price).to_f
  end
end
