class AddStatusToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :status, :interger, default: 1
  end
end
