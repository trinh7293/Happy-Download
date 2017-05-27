class AddFieldsToOrderDetails < ActiveRecord::Migration[5.0]
  def change
    add_column :order_details, :seller_id, :integer
    add_column :order_details, :buyer_id, :integer
  end
end
