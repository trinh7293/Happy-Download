class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.integer :notified_by_id
      t.integer :notificationable_id
      t.string :notificationable_type
      t.string :notice_type
      t.integer :read, default: 0
      t.integer :checked, default: 0

      t.timestamps null: false
    end
    add_index :notifications, :user_id
    add_index :notifications, :notified_by_id
    add_index :notifications, ["notificationable_id", "notificationable_type"], :name => "fk_notificationables"
    add_index :notifications, [:read, :checked]
  end
end
