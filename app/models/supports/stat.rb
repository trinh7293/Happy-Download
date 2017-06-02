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
    (rp..Date.today).map{|date| sale_on date, current_user}.inspect
  end

  def dt_order current_user
    (rp..Date.today).map{|date| order_on date, current_user}.inspect
  end

  private
  def sale_on date, current_user
    current_user.sales.cash_on(date).sum :price
  end

  def order_on date, current_user
    current_user.purchases.cash_on(date).sum :price
  end
end
