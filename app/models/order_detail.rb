class OrderDetail < ApplicationRecord
  belongs_to :product
  belongs_to :order
  belongs_to :buyer, class_name: User.name
  belongs_to :seller, class_name: User.name
  scope :cash_on, (->date{where "date(created_at) = ?", date})
  scope :ordered, (->{order created_at: :desc})
  scope :ordered_by_sum, (->{order("sum(price) DESC")})

  class << self
    def most_purchase_order_details
      self.group(:product_id).order("count(product_id) DESC")
        .first Settings.category.nav_number
    end

    def most_purchase_products
      self.most_purchase_order_details.map &:product
    end

    def best_seller_order
      self.group(:seller_id).ordered_by_sum.first Settings.category.nav_number
    end

    def best_seller_user
      self.best_seller_order.map &:seller
    end

    def best_seller_amount
      self.best_seller_user.map{|user| user.sales.sum("price")}
    end
  end
end
