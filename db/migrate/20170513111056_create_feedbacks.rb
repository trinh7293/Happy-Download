class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.integer :user_id
      t.integer :product_id

      t.text :content
      t.integer :star

      t.timestamps
    end
  end
end
