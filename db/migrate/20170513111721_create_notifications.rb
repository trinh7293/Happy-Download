class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.integer :notifier_id
      t.integer :notifiee_id
      t.integer :product_id
      t.string :notify_type
      t.boolean :isread

      t.timestamps
    end
    add_index :notifications, :notifier_id
    add_index :notifications, :notifiee_id
    add_index :notifications, :product_id
  end
end
